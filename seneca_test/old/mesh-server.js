//require('seneca')()

////.listen( {port: function () { return process.argv[2] }} )

//.add('a:1', function (msg, done) {
    //done( null, {a: 1, x: msg.x} )
//})

//.use('mesh', {
    //isbase: true
//})

var Seneca = require('seneca')

Seneca()

// provide an action for the format:hex pattern
.add('format:hex', function (msg, done) {

    // red is the only color supported!
    var color = 'red' === msg.color ? '#FF0000' : '#FFFFFF'

    done(null, {
        color: color
    })
})

// load the mesh plugin
.use('mesh', {

    // this is a base node
    isbase: true,

    // this service will respond to the format:hex pattern
    pin: 'format:hex'
})
