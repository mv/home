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
    Linux | MINGW* | CYGWIN* )
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

# View current ls colors
#   dircolors --print-ls-colors           > colors-ansi.txt
#   dircolors -p | grep -v -e '^ ?#|TERM' > colors-defs.txt
#   paste colors-ansi.txt colors-defs.txt
if   which dircolors &>/dev/null
then
    eval 'dircolors' &>/dev/null

    # add more colors
    export LS_COLORS=${LS_COLORS}:'*.txt=32:*.log=33:*.sql=31:*.buf=31'

    # WSL/Fedora: redefine
    [ "${WSL_DISTRO_NAME}" ] && export LS_COLORS=${LS_COLORS}:'tw=33;04:ow=34;04'

fi
