#!/bin/bash

###
### mvf
### bashrc generic utils

alias    env='env | sort'
alias   less='less -r'                    # raw control characters
alias   grep='egrep --color'              # show differences in colour

alias dtfile='date "+%Y-%m-%d_%H%M"'
alias  dtiso='date "+%Y-%m-%d %X"'
alias  dtdns='date "+%Y%m%d%H%M%S"'

alias  csort='sort | uniq -c | sort -n' # column sort/count

alias aliasg='alias | grep'

alias scpresume='rsync --partial --progress --rsh=ssh'

export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
alias    h='history'
function hcount {
    [ "$1" ] && _line=$1 || _line=10
  # history | awk '{a[$2]++} END{ for(i in a){ print a[i] " " i} }' | sort -rn | head -${_line}
    history | awk '{a[$4]++} END{ for(i in a){ print a[i] " " i} }' | sort -rn | head -${_line}
}

# Auto chdir
function preexec () {
    if [ ! `which $BASH_COMMAND` ]                \
    && [   `echo  $BASH_COMMAND  | wc -w` = '1' ] \
    && [       -d $BASH_COMMAND  ]
    then
        cd $BASH_COMMAND
        return 1
    fi
}


# vim: ft=sh:
