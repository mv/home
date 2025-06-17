#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# function cd  {
#     builtin cd "$@" && gls -F --color
# }

function mkcd  {
    mkdir -p "$1" && cd "$1"
}

alias     ..='\cd .. && ls -F --color'
alias   cd..='\cd .. && ls -F --color'
alias  findd='find . -type d | egrep -i '
alias  findf='find . -type f | egrep -i '
alias    chg='find .         -exec chmod g+w,o-w {} \;'
alias    chd='find . -type d -exec chmod 775 {} \;'
alias    chf='find . -type f -exec chmod 664 {} \;'
alias     kd='find . -type d | wc -l'
alias     kf='find . -type f | wc -l'
alias kountd='for f in *; do printf "%40s %9d\n" "$f" `find "$f" -type d | wc -l`; done'
alias kountf='for f in *; do printf "%40s %9d\n" "$f" `find "$f" -type f | wc -l`; done'

alias  sizef='find . -type f | xargs du -h | sort -hr | head'
alias  sized='find . -type d | xargs du -h | sort -hr | uniq | head'

# vim: ft=sh:

