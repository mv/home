#!/bin/bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### macos:~/.bashrc

# [ -e ~/.bashrc-debug   ] && echo "[~/.bashrc]: found: ~/.bashrc-debug"
# [ -e ~/.bashrc-verbose ] && echo "[~/.bashrc]: found: ~/.bashrc-verbose"
export _BASHRC_VERBOSE="true"
export _BASHRC_DEBUG="false"

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

export BASH_SILENCE_DEPRECATION_WARNING=1

set -o vi
umask 002

export LANG=en_US.UTF-8

export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'
export HISTTIMEFORMAT='[%Y-%m-%d %T] '

export CDPATH=.
export CDPATH=$CDPATH:~/
export CDPATH=$CDPATH:~/work
export CDPATH=$CDPATH:~/work/dev
export CDPATH=$CDPATH:~/work/mv

eval "$(direnv hook bash)"
