#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== Bash/ls"

_bsd='-AFhG'
_gnu='-AFh --color=auto --group-directories-first --time-style=long-iso'
_box='-AFh --color=auto --group-directories-first'

if [ -f /etc/os-release ]
then _os_release=$(awk -F= '/^ID/ {print $2}' /etc/os-release)
fi

case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias ls='ls -AFhG'
        ;;
    Linux)
        alias ls="ls ${_gnu}"

        # bright colors: http://www.walkernews.net/2007/03/29/brighten-linux-ls-command-output-with-ls_colors/
        # eval `echo $LS_COLORS | sed 's/00;/01;/g' | awk '{print "export LS_COLORS=\""$0"\""}' `

        # apk add coreutils
#       if [ "${_os_release}" == "alpine" ]
#       then alias ls="ls ${_box}"
#       fi
        ;;
    *)
        alias ls='ls -AF'
        ;;
esac

if _cmd_exists gls
then alias ls='gls -AFh --color=auto --time-style=long-iso --group-directories-first'
fi

alias ll='ls -l'                       # long list
alias lr='ls -ltr'                     # long list
alias la='ls -A'                       # all but . and ..
alias  l='gls --color'
export LS_COLORS='*sql=33:*log=93:*buf=31'

# View current ls colors
#   dircolors --print-ls-colors           > colors-ansi.txt
#   dircolors -p | grep -v -e '^ ?#|TERM' > colors-defs.txt
#   paste colors-ansi.txt colors-defs.txt
if  _cmd_exists dircolors
then eval 'dircolors' &>/dev/null
fi
