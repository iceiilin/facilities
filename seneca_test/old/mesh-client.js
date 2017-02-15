//require('seneca')()
////.use('balance-client')

////.client( {type: 'balance'} )
////.client( {port: 47000} )
////.client( {port: 47001} )

////.ready( function () {
    ////for ( var i = 0; i < 2; i++ ) {
//.use('mesh')
//.act( 'a:1,x:1', console.log );
    ////}
////})

var Seneca = require('seneca')

Seneca()

// load the mesh plugin
.use('mesh')

// send a message out into the network
// the network will know where to send format:hex messages
.act('format:hex, color:red', function (err, out) {

    // prints #FF0000
    console.log(out.color)

    // disconnect from the network
    this.close()
})
