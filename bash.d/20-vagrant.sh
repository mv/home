#!/bin/bash

###
### mvf
### vagrant aliases

# set -x
if which vagrant 2>/dev/null 1>/dev/null
then
    alias  vsd='vagrant destroy -f'
    alias  vsh='vagrant halt'
    alias  vst='vagrant status'
    alias  vsu='vagrant up'
    alias vssh='vagrant ssh'
fi

# vim: ft=sh:

