#!/bin/bash

###
### mvf
### vagrant aliases

# set -x
if which vagrant 2>/dev/null 1>/dev/null
then
    alias  vdf='vagrant destroy -f'
    alias  vst='vagrant status'
    alias  vht='vagrant halt'
    alias  vup='vagrant up'
    alias vssh='vagrant ssh'
fi

# vim: ft=sh:

