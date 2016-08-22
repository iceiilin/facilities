// Copyright 2016, EMC, Inc.

'use strict';

var ssh = require('ssh2');
//var Promise = require('Promise');
var _ = require('lodash');

var conn = new ssh.Client();
var sshSettings = {
    host: "172.31.128.3",
    user: "root",
    password: "1234567",
    debug: console.log
    //host: "172.31.128.2",
    //user: "monorail",
    //password: "monorail",
    //debug: console.log
};

conn.on('ready', function() {
    conn.end();
    console.log("ready");
})
.on('error', function(err) {
    conn.end();
    console.log(err);
});
conn.connect(_.defaults({
        readyTimeout: 20000,
        username: sshSettings.user
    }, sshSettings)
);
