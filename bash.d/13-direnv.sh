#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

#
# Jun/2023
#
#

if _cmd_exists direnv
then _bashrc_verbose "== Direnv"
else _bashrc_verbose "== Direnv: NOT FOUND"
fi

# Remember:
#   add: eval "$(direnv hook bash)"
#   to the end of .bashrc
#   to ensure it executes after all bash.d processing
#

