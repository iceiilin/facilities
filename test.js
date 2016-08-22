// Copyright 2015, EMC, Inc.
/* jshint node: true */
"use strict";

var test={"a":1};
if (!test.b) {
    console.log("no b");
}
//var anchor = require('anchor');

//var value7 = 'a6a';
//var value1 = '100-564-260-00';

////var rule = {regex: /^a./};
//var rule = {regex: /100-564-26[04]-(\d{2})/};

//debugger;
//var ret7 = anchor(value7).to(rule);
//var ret1 = anchor(value1).to(rule);
//console.log(ret7);
//console.log(ret1);


////var Promise = require('bluebird');

//var array = undefined;

//Promise.map(array, function(item) {
    //console.log(item);
//});

// --------------------------------------
//var _ = require('lodash');

//var src = [
    //{
        //'relationType':'1'
    //}
//];

//var find = _.find(src, {relationType: '2'});
//var target = find.targets;

//console.log(find);
//-------------------------------------

//var childProcess = require('child_process');

//var args = ['echo','hello','||','true'];

//childProcess.execFile('/bin/bash',args,{}, function (error, stdout, stderr) {
    //console.log(error);
    //console.log(stdout);
    //console.log(stderr);
//-------------------------------------

//var Promise = require('bluebird');
//var res;
//debugger;
//new Promise(function(resolve) {
    //res = resolve;
//})
//console.log(res);

//-------------------------------------
//var hogan = require('hogan.js');

//var template = hogan.compile('{{#list}}{{foo}}{{> par}}\n{{/list}}');
//var partial = hogan.compile('/*{{partialData.name}}-{{partialData.age}}*/');

//var result = template.render(
    //{
        //list: [
            //{ foo: 1 },
            //{ foo: 2 },
            //{ foo: 3, sub: { list: [{ foo: 4 }, { foo: 5 }] } }
        //],
        //partialData:{name:"george", age:30}
    //},
    //{ par: partial  }
//);

//console.log(result);
//var template = '{{#list}} '+
                    ////'command:{{command}}, code:{{code}}' +
                    //'{{.}}' +
                //'{{/list}}';
////var text = "{{^check}}{{#i18n}}No{{/i18n}}{{/check}}";
////text +=  "{{#check}}{{#i18n}}Yes{{/i18n}}{{/check}}";
////var scan = hogan.scan(text);
////var tree = hogan.parse(hogan.scan(text));
//var data = {
    //list: [
        //{
            //command: 'abc',
            //code: [1]
        //},
        //{
            //command: 'def'
        //}
    //]
//};

//var ret = hogan.compile(template).render(data);
//debugger;
//console.log(ret);


//-------------------------------------
//var data=undefined;
//var ret = false;
//function checkValidAcceptCode(code) {
    //if (!(code instanceof Array)) {
        //return false;
    //}

    //return code.every(function(item) {
        //debugger;
        //if (typeof item !== 'number') {
            //return false;
        //}
        //return true;
    //});
//}
//ret = checkValidAcceptCode(data);
//console.log(ret);

//-------------------------------------
//var childProcess = require('child_process');
//var exec = childProcess.exec;

//exec('ipmitool', {}, function(error, stdout, stderr) {
    //debugger;
//});
