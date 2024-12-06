#!/bin/bash

###
### mvf
### bashrc lib

alias df='df -Phl'
alias du='du -h'

if   which column &>/dev/null
then alias mount='mount | column -t'
fi


# vim: ft=sh:
