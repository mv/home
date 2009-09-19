#!/bin/bash

###
### mvf
### bashrc lib

# ls {
case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias ls='ls -AFhG'
        ;;
    Linux)
        alias ls='ls -AFh --color=auto --time-style=long-iso --group-directories-first'
        # bright colors: http://www.walkernews.net/2007/03/29/brighten-linux-ls-command-output-with-ls_colors/
        # eval `echo $LS_COLORS | sed 's/00;/01;/g' | awk '{print "export LS_COLORS=\""$0"\""}' `
        ;;
    *)
        alias ls='ls -AF'
        ;;
esac

[ `which gls 2>/dev/null` ] && alias ls='gls -AFh --color=auto --time-style=long-iso --group-directories-first'

alias ll='ls -l'                       # long list
alias lr='ls -ltr'                     # long list
alias la='ls -A'                       # all but . and ..
alias  l='/bin/ls'
export LS_COLORS='*sql=33:*log=93:*buf=31'
# }


# vim: ft=sh:

