#!/bin/bash
# vim: ft=sh foldlevel=0:

###
### mvf
### macos:~/.bashrc

[ -e ~/.shell-debug-enable ] && echo "~/.shell-debug-enable: [~/.bashrc]"

## to remember:
## https://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files
##
##   bash login
##     1. /etc/profile
##     2. ~/.bash_profile | ~/.bash_login | ~/.profile
##     3. ~/.bash_profile: source ~/.bashrc
##
##   bash logout
##     1. ~/.bash_logout

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

set -o vi
umask 002

export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

export CDPATH=.
export CDPATH=$CDPATH:~/
export CDPATH=$CDPATH:~/work
export CDPATH=$CDPATH:~/work/aws
export CDPATH=$CDPATH:~/work/dev
export CDPATH=$CDPATH:~/work/mv
export CDPATH=$CDPATH:~/WorkDocs
export CDPATH=$CDPATH:~/WorkDocs/amzn
export CDPATH=$CDPATH:~/WorkDocs/training
export CDPATH=$CDPATH:/pub


