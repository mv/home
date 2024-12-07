#!/bin/bash

###
### mvf
### bashrc lib

if which VBoxManage &>/dev/null
then
    alias vbm="VBoxManage"
    alias vboxmanage="VBoxManage"
    alias vbox="VirtualBox &"

    alias vlist='vbm list vms'

fi

# vim: ft=sh:
