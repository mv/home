#!/bin/bash
### mvf
### bashrc lib

# DTerm.app:
#     fortune only available if inside a REAL terminal
#

if which fortune          > /dev/null \
&& echo $TERM | grep term > /dev/null
then
    echo "______________________________________________________________________"
    echo
    fortune
    echo "______________________________________________________________________"
    echo
fi


# vim: ft=sh:

