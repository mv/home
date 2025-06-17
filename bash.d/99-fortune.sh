#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== Fortune"

# DTerm.app:
#     $TERM: fortune only available if inside a REAL terminal
#

[ "${TERM_PROGRAM}"  == "vscode" ] && return 0    # skip vscode terminal

if _cmd_exists fortune \
&& echo $TERM | grep term > /dev/null \
&& [ "${_BASHRC_VERBOSE}" == "true" ] # && [ -e ~/.bashrc-verbose ]
then
    echo "______________________________________________________________________"
    echo
    fortune
    echo "______________________________________________________________________"
    echo
fi
