'use strict';

var ejs = require('ejs');
var fs = require('fs');
var option={
            "version": "7",
            "repo": "http://172.31.128.1:9080/centos/7/os/x86_64",
            "rootPassword": "RackHDRocks!",
            "hostname": "localhost",
            "domain": "example.com",
            "users": [
                {
                    "name": "rackhd1",
                    "password": "123456",
                    "uid": 1010,
                },
                {
                    "name": "rackhd2",
                    "password": "123456",
                    "sshKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJQ631/sw3D40h/6JfA+PFVy5Ofz6eu7caxbv0zdw4fTJsrFcOliHZTEtAvqx7Oa8gqSC6d7v61M0croQxtt1DGUcH2G4yhfdZOlK4pr5McwtX0T/APACdAr1HtP7Bt7u43mgHpUG4bHGc+NoY7cWCISkxl4apkYWbvcoJy/5bQn0uRgLuHUNXxK/XuLT5vG76xxY+1xRa5+OIoJ6l78nglNGrj2V+jH3+9yZxI43S9I3NOCl4BvX5Cp3CFMHyt80gk2yM1BJpQZZ4GHewkI/XOIFPU3rR5+toEYXHz7kzykZsqt1PtbaTwG3TX9GJI4C7aWyH9H+9Bt76vH/pLBIn rackhd@rackhd-demo"
                }
            ],
            "rootSshKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJQ631/sw3D40h/6JfA+PFVy5Ofz6eu7caxbv0zdw4fTJsrFcOliHZTEtAvqx7Oa8gqSC6d7v61M0croQxtt1DGUcH2G4yhfdZOlK4pr5McwtX0T/APACdAr1HtP7Bt7u43mgHpUG4bHGc+NoY7cWCISkxl4apkYWbvcoJy/5bQn0uRgLuHUNXxK/XuLT5vG76xxY+1xRa5+OIoJ6l78nglNGrj2V+jH3+9yZxI43S9I3NOCl4BvX5Cp3CFMHyt80gk2yM1BJpQZZ4GHewkI/XOIFPU3rR5+toEYXHz7kzykZsqt1PtbaTwG3TX9GJI4C7aWyH9H+9Bt76vH/pLBIn rackhd@rackhd-demo",
            "networkDevices": [
                {
                    "device": "eth0",
                    "ipv4": {
                        "ipAddr": "192.168.11.89",
                        "gateway": "192.168.11.1",
                        "netmask": "255.255.255.0"
                    },
                    "ipv6": {
                        "ipAddr": "2001:0db8:85a3:0000:0000:8a2e:0370:7334",
                        "gateway": "2001:0db8:85a3:0000:0000:8a2e:0370:0001",
                        "netmask": "ffff.ffff.ffff.ffff.0.0.0.0"
                    }
                },
                {
                    "device": "eth1",
                    "ipv4": {
                        "ipAddr": "10.62.59.220",
                        "gateway": "10.62.59.1",
                        "netmask": "255.255.255.0",
                        "vlanIds": [105, 109]
                    },
                    "ipv6": {
                        "ipAddr": "2001:0db8:85a3:0000:0000:8a2e:0370:7338",
                        "gateway": "2001:0db8:85a3:0000:0000:8a2e:0370:0001",
                        "netmask": "ffff.ffff.ffff.ffff.0.0.0.0",
                        "vlanIds": [106, 108]
                    }
                }
            ],
            "kvm": true,
            "installDisk": "/dev/sda",
            "installType": "minimal",
            "installPartitions": [
                {
                    "mountPoint": "/boot",
                    "size": "500",
                    "fsType": "ext3"
                },
                {
                    "mountPoint": "swap",
                    "size": "500",
                    "fsType": "swap"
                },
                {
                    "mountPoint": "/",
                    "size": "auto",
                    "fsType": "ext3"
                }
            ]
        };

//var template = fs.readFileSync('./post-install-photon.sh', 'utf-8');
//var template = fs.readFileSync('data/templates/photon-os-ks', 'utf-8');
var template = fs.readFileSync('data/templates/install-photon/post-install-photon.sh', 'utf-8');
//var template = fs.readFileSync('photon-os-ks', 'utf-8');
var ret = ejs.render(template, option);
fs.writeFileSync('output', ret);

