#!/bin/bash

###
### mvf
### macos:~/.bashrc

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

export CDPATH=.:~/:/work:/work/eden:/work/dinda:/work/baby:/work/wip:/work/dev:/work/devops:/pub:/work/devops/puppet/global
export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

alias rehash='source ~/.bashrc'

set -o vi
umask 002

# vim: ft=sh foldlevel=0:
