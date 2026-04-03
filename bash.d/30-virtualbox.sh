#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib


if _cmd_exists VBoxManage
then _bashrc_verbose "== Virtualbox"
else return
fi

alias vbm="VBoxManage"
alias vboxmanage="VBoxManage"
alias vbox="VirtualBox &"

alias vlist='vbm list vms'