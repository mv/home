#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### vagrant aliases


# set -x
if _cmd_exists vagrant
then
    _bashrc_verbose "== Vagrant"
    alias  vdf='vagrant destroy -f'
    alias  vst='vagrant status'
    alias  vht='vagrant halt'
    alias  vup='vagrant up'
    alias vssh='vagrant ssh'
else :
#   _bashrc_verbose "== Vagrant: NOT FOUND"
fi
