require('seneca')({internal: {logger: require('seneca-legacy-logger')}})
.use('math') // finds ./math.js in local folder
.listen({ type: 'tcp', pin: 'role:math' });
