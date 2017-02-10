'use strict';

var amqp = require('amqp');
var Promise = require('bluebird');

var exchangeOption = {
    type: "topic",
    durable: true,
    autoDelete: false
};

function connection() {
}

connection.start = function(exchangeName) {

    return new Promise(function(resolve) {

        var con = new amqp.createConnection({
            url: "amqp://guest:guest@localhost:5672",
            heartbeat: 5,
            clientProperties: { applicationName:"myapp"}
        });

        con.on('ready', function() {
            console.log('con ready');
            con.ext = con.exchange(exchangeName, exchangeOption, function() {
                console.log('exchange created');
                return resolve(con);
            });
        });

        con.on('error', function(err) {
            console.log('con error');
            console.log(err);
        });

    });
};

connection.addQueue = function(con, qName, flag) {
    return new Promise(function(resolve) {
        var q = con.queue(qName, {'exclusive': true}, function(queue) {
        //var q = con.queue(qName, function(queue) {
            console.log(queue.name + ' created');
            queue.bind('test-exchange', '123', function() {
                queue.subscribe(function(msg, header, deliveryInfo, msgObj) {
                    console.log(flag);
                    console.log(msg);
                    //console.log('---------');
                    //console.log(header);
                    //console.log('---------');
                    //console.log(deliveryInfo);
                    //console.log('---------');
                    //console.log(msgObj);
                }).addCallback(function(){
                    resolve(q);
                });
            });
        });
    });
};

return Promise.all([
    connection.start('test-exchange'),
    connection.start('test-exchange')
]).then(function(connections) {
    var transmit = connections[0];
    var receive = connections[1];
    // create a queue for subscription

    //return new Promise(function(resolve){
        //setTimeout(function(){
            return Promise.all([
                transmit,
                receive,
                connection.addQueue(transmit, 'new queue', '11111'),
                connection.addQueue(transmit, 'new queue', '22222')
            ]);
        //}, 5000)
        //.then(function(arr){
            //resolve(arr);
        //});
    //});

}).then(function(info){
    return new Promise(function(resolve){
        info[2].subscribe(function() {
            console.log('==============');
            console.log('another bind');
            console.log('==============');
        }).addCallback(function(){
            resolve(info);
        });
    });
}).then(function(info){
    var exchange = info[0].ext;
    console.log('!!here!!');
    return new Promise(function(resolve){
        exchange.publish('123', 'test', function() {
            resolve(info);
        });
        //info[2].unbind('amq.topic','123');
    });
}).then(function(info){
    var exchange = info[0].ext;
    console.log('!!here!!');
    return new Promise(function(resolve){
        exchange.publish('123', 'test', function() {
            resolve(info);
        });
        //info[2].unbind('amq.topic','123');
    });
});
