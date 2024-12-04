#!/bin/bash
### mvf
### bashrc lib

# DTerm.app:
#     fortune only available if inside a REAL terminal
#

if which fortune 2>/dev/null 1>/dev/null \
&& echo $TERM | grep term 2>/dev/null
then
    echo "______________________________________________________________________"
    echo
    fortune
    echo "______________________________________________________________________"
    echo
fi


# vim: ft=sh:

