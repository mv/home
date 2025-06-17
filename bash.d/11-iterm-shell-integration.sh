#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib


if [ -e "${HOME}/.iterm2_shell_integration.bash" ]
then
  _bashrc_verbose "== iTerm2"
  source "${HOME}/.iterm2_shell_integration.bash"
fi

