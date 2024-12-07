#!/bin/bash

###
### mvf
### vagrant aliases

# set -x
if which vagrant &>/dev/null
then
    alias  vdf='vagrant destroy -f'
    alias  vst='vagrant status'
    alias  vht='vagrant halt'
    alias  vup='vagrant up'
    alias vssh='vagrant ssh'
fi

# vim: ft=sh:
