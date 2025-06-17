#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== Virtualbox"

if _cmd_exists VBoxManage
then
    alias vbm="VBoxManage"
    alias vboxmanage="VBoxManage"
    alias vbox="VirtualBox &"

    alias vlist='vbm list vms'
fi
