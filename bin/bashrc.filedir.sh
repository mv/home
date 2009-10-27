#!/bin/bash

###
### mvf
### bashrc lib

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

function cd  {
    builtin cd "$@" && ls
}
function mkcd  {
    mkdir -p "$1" && cd "$1"
}

alias     ..='\cd .. && ls'
alias   cd..='\cd .. && ls'
alias  findd='find . -type d | egrep -i '
alias  findf='find . -type f | egrep -i '
alias    chg='find .         -exec chmod g+w,o-w {} \;'
alias    chd='find . -type d -exec chmod 775 {} \;'
alias    chf='find . -type f -exec chmod 664 {} \;'
alias     kd='find . -type d | wc -l'
alias     kf='find . -type f | wc -l'
alias kountd='for f in *; do printf "%40s %9d\n" $f `find $f -type d | wc -l`; done'
alias kountf='for f in *; do printf "%40s %9d\n" $f `find $f -type f | wc -l`; done'

# vim: ft=sh:

