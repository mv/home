#!/bin/bash

###
### mvf
### bashrc lib



_bsd='-AFhG'
_gnu='-AFh --color=auto --group-directories-first --time-style=long-iso'
_box='-AFh --color=auto --group-directories-first'

if [ -f /etc/os-release ]
then _os_release=$(awk -F= '/^ID/ {print $2}' /etc/os-release)
fi

case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias ls="ls ${_bsd}"
        ;;
    Linux | MINGW* | CYGWIN* )
        alias ls="ls ${_gnu}"

        if [ "${_os_release}" == "alpine" ]
        then alias ls="ls ${_box}"
        fi
        ;;
    *)
        alias ls='ls -AF'
        ;;
esac

# Homebrew
if   which gls &>/dev/null
then alias ls="gls ${_gnu}"
fi

alias ll='ls -l'       # long list
alias lr='ls -ltr'     # long list
alias la='ls -A'       # all but . and ..
alias  l='ls --color'
