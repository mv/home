#!/bin/bash

###
### mvf
### bashrc lib

# MacOS X {

[ `uname -s` != "Darwin" ] && return

alias sleep_ram='sudo pmset -a hibernatemode 0'
alias sleep_hdd='sudo pmset -a hibernatemode 1'
alias sleep_combined='sudo pmset -a hibernatemode 3'

alias rmdst='find . -type f -name .DS_Store | xargs rm -f'

# vim: ft=sh:

