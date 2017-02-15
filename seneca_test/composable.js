var seneca = require('seneca')();

seneca.add({role: 'math', cmd: 'sum'}, function(msg, respond){
    console.log('general sum');
    var sum = msg.left + msg.right;
    respond(null, {answer: sum});
});

seneca.add({role: 'math', cmd: 'sum'}, function(msg, respond){
    this.prior({
        role: 'math',
        cmd: 'sum',
        left: msg.left,
        right: msg.right
    }, function(err, result) {
        console.log('other sum');
        if(err) return respond(err);
        result.info = msg.left + '+' + msg.right;
        respond(null, result);
    });
});

seneca.add({role: 'math', cmd: 'product'}, function(msg, respond){
    var product = msg.left * msg.right;
    respond(null, {answer: product});
});

seneca.act({role: 'math', cmd: 'sum', left:2.5, right:3.5}, console.log);
