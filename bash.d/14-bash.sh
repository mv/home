#!/bin/bash
# vim: ft=sh foldlevel=0:

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

export LANG=en_US.UTF-8

#xport HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

export BASH_SILENCE_DEPRECATION_WARNING=1

export CDPATH=.
export CDPATH=$CDPATH:~/
export CDPATH=$CDPATH:~/work
export CDPATH=$CDPATH:~/work/dev
export CDPATH=$CDPATH:~/wip

set -o vi
umask 002
