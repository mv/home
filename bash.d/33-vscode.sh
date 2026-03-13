#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib


# pathadd "$HOME/AppData/Local/Programs/Microsoft VS Code/bin"

if _cmd_exists "$HOME/AppData/Local/Programs/Microsoft VS Code/bin/code"
then :
    _bashrc_verbose "== Visual Studio Code"
    alias code="$HOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
else :
#   _bashrc_verbose "== Visual Studio Code: NOT FOUND"
fi
