#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== Bash/Completion"


export BASH_COMPLETION_DIR="~/bash_completion.d"

# BASH_COMPLETION_DEBUG=1
  [ -f /usr/local/etc/bash_completion    ] && source /usr/local/etc/bash_completion
  [ -f /opt/homebrew/etc/bash_completion ] && source /opt/homebrew/etc/bash_completion

##[ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && echo_source /usr/local/etc/bash_completion.d/cdargs-bash.sh
