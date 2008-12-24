#!/bin/bash -x
#

sudo \rm /etc/resolv.conf
sudo ln -s /etc/resolv.conf.mih.lan /etc/resolv.conf
ls -l /etc/resolv*
