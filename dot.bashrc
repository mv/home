#!/bin/bash
# vim: ft=sh foldlevel=0:

###
### mvf
### macos:~/.bashrc

[ -e ~/.shell-debug-enable ] && echo "~/.shell-debug-enable: [~/.bashrc]"

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

set -o vi
umask 002

export LANG=en_US.UTF-8

export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

export CDPATH=.
export CDPATH=$CDPATH:~/
export CDPATH=$CDPATH:~/work
export CDPATH=$CDPATH:~/work/pismo
export CDPATH=$CDPATH:~/work/aws
export CDPATH=$CDPATH:~/work/dev
export CDPATH=$CDPATH:~/work/mv

export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(direnv hook bash)"

