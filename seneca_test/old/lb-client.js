require('seneca')()
.use('balance-client')

.client( {type: 'balance'} )
.client( {port: 47000} )
.client( {port: 47001} )

.ready( function () {
    for ( var i = 0; i < 2; i++ ) {
        this.act( 'a:1,x:1', console.log );
    }
})

