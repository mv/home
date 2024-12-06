#!/bin/bash

###
### mvf
### bashrc lib

_bsd='-AFhG'
_gnu='-AFh --color=auto --time-style=long-iso --group-directories-first'

case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias ls="ls ${_bsd}"
        ;;
    Linux)
        alias ls="ls ${_gnu}"
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

# bright colors: http://www.walkernews.net/2007/03/29/brighten-linux-ls-command-output-with-ls_colors/
# eval `echo $LS_COLORS | sed 's/00;/01;/g' | awk '{print "export LS_COLORS=\""$0"\""}' `
export LS_COLORS='*sql=33:*log=93:*buf=31'
