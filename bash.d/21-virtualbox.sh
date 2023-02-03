#!/bin/bash

###
### mvf
### bashrc lib

if which VBoxManage 2>/dev/null 1>/dev/null
then
    alias vbm="VBoxManage"
    alias vboxmanage="VBoxManage"
    alias vbox="VirtualBox &"

    alias vlist='vbm list vms'

fi

# vim: ft=sh:

