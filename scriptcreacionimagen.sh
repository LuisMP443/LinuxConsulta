#!/bin/bash
add-apt-repository ppa:gottcode/gcppa -y
apt-get update
apt-get install xfce4-whiskermenu-plugin -y
adduser usuario
passwd -d -u usuario

