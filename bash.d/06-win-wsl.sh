#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib


# MacOS X {

if uname -a | /bin/grep 'WSL2' -q
then :
  _bashrc_verbose "== Win/WSL2"
else :
  return
fi


pathadd /mnt/c/Windows after
#athadd /mnt/c/Windows/System32

alias open="explorer"
