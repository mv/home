#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### vagrant aliases

_bashrc_verbose "== Vagrant"

# set -x
if _cmd_exists vagrant
then
    alias  vdf='vagrant destroy -f'
    alias  vst='vagrant status'
    alias  vht='vagrant halt'
    alias  vup='vagrant up'
    alias vssh='vagrant ssh'
fi
