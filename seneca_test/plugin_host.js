require('seneca')()
.use(require('./plugin.js'))
.act({role: 'math', cmd: 'sum', left:2.5, right:3.5}, console.log);
