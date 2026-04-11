#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

if   _cmd_exists fortune
then _bashrc_verbose "== Fortune"
else return 0
fi

# DTerm.app:
#     $TERM: fortune only available if inside a REAL terminal

# DTerm.app:
#     $TERM: fortune only available if inside a REAL terminal
#

[ "${TERM_PROGRAM}"  == "vscode" ] && return 0    # skip vscode terminal

if echo $TERM | grep term > /dev/null \
&& [ "${_BASHRC_VERBOSE}" == "true" ] # && [ -e ~/.bashrc-verbose ]
then
    echo "______________________________________________________________________"
    echo
    fortune
    echo "______________________________________________________________________"
    echo
fi
