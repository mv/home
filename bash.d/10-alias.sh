#!/bin/bash

###
### mvf
### bashrc generic utils

alias    env='env | sort'
alias   envg='env | sort | grep -i '
alias aliasg='alias | grep -i '

alias less='less -r'                    # raw control characters
alias grep='egrep --color'              # show differences in colour
alias csort='sort | uniq -c | sort -n' # column sort/count

alias  dtfile='date "+%F_%H%M"'
alias   dtiso='date "+%F %X"'
alias   dtdns='date "+%Y%m%d%H%M%S"'
alias dtepoch='date "+%s"'


alias ssane='stty sane'        # restore terminal
alias scpresume='rsync --partial --progress --rsh=ssh'

export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
alias    h='history'
function hcount {
    [ "$1" ] && _line=$1 || _line=10
  # history | awk '{a[$2]++} END{ for(i in a){ print a[i] " " i} }' | sort -rn | head -${_line}
    history | awk '{a[$4]++} END{ for(i in a){ print a[i] " " i} }' | sort -rn | head -${_line}
}

man() {
    /usr/bin/env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    /usr/bin/man "$@"
}


# Auto chdir
# function preexec () {
#     if [ ! `which $BASH_COMMAND` ]                \
#     && [   `echo  $BASH_COMMAND  | wc -w` = '1' ] \
#     && [       -d $BASH_COMMAND  ]
#     then
#         cd $BASH_COMMAND
#         return 1
#     fi
# }


# vim: ft=sh:

