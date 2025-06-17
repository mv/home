#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== Git"

# Version control {
#[ `which svn 2> /dev/null` ] && alias    pset='svn propset svn:keywords "Id URL Rev Author Date"'
#[ `which svk 2> /dev/null` ] && alias svkpset='svk propset svn:keywords "Id URL Rev Author Date"'

if which git 2>&1 >/dev/null
then

    [ -f ~/bin/git-completion.sh ] && source ~/bin/git-completion.sh

    export GIT_EDITOR=vim
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1

    alias  gb='git branch'
    alias gba='git branch -a -v'
    alias  gc='git commit -v'
    alias gpr='git pull --rebase'
    alias gpp='git pull && git push'
    alias gpl='git pull'
    alias gps='git push'
    alias  gp='git push'
    alias gst='git status'
    alias  gd='git diff | vim -'

    alias gitk='gitk --all &'
    alias gitclean='git remote prune origin && git remote update'

function git-add() {
    [ -z "$1" ] && {
        echo "Usage: git-add [dir|file]"
        return
    }
    git add "$1"
    git commit -m 'Added.'
}

function git-upd() {
    [ -z "$1" ] && {
        echo "Usage: git-upd [dir|file]"
        return
    }
    git add "$1"
    git commit -m 'Updated...'
    git pull --rebase && git push
}

function git-new-branch() {
    [ -z "$1" ] && return

    git push origin $1:refs/heads/$1
#   git checkout --track -b $1 origin/$1
}

function git-rm-branch() {
    [ -z "$1" ] && return

    git checkout master
    git branch -d           $1
    git branch -d -r origin/$1

}

fi
# }

# Devel {

# function tags() {
#     if [ -z "$1" ]
#     then ctags --verbose --recurse
#     else ctags --verbose --recurse --languages=$1
#     fi
# }

# }

# alias rmsvn='find . -type d -name .svn      | xargs rm -rf'
