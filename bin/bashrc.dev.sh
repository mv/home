#!/bin/bash

###
### mvf
### bashrc lib

# Version control {
[ `which svn 2> /dev/null` ] && alias    pset='svn propset svn:keywords "Id URL Rev Author Date"'
[ `which svk 2> /dev/null` ] && alias svkpset='svk propset svn:keywords "Id URL Rev Author Date"'

if which git > /dev/null
then
    alias  gb='git branch'
    alias gba='git branch -a -v'
    alias  gc='git commit -v'
    alias gpp='git pull && git push'
    alias gpl='git pull'
    alias gps='git push'
    alias  gp='git push'
    alias gst='git status'
    alias  gd='git diff | vim -'

    alias gitk='gitk --all &'
    alias gitclean='git remote prune origin && git remote update'

function git-add() {
    [ -z "$1" ] && return
    set -x
    git add "$1"
    git commit -m 'Added.'
#   git push
    set +x
}

function git-new-branch() {
    [ -z "$1" ] && return
    set -x
    git push origin $1:refs/heads/$1
#   git checkout --track -b $1 origin/$1
    set +x
}

function git-rm-branch() {
    [ -z "$1" ] && return
    set -x
    git checkout master
    git branch -d           $1
    git branch -d -r origin/$1
    set +x
}

fi
# }

# Devel {

function tags() {
    if [ -z "$1" ]
    then ctags --verbose --recurse
    else ctags --verbose --recurse --languages=$1
    fi
}

# }

alias rmsvn='find . -type d -name .svn      | xargs rm -rf'

# vim: ft=sh:

