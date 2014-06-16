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

set -o vi
umask 002

export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

export CDPATH=.
export CDPATH=$CDPATH:~/
export CDPATH=$CDPATH:/work
export CDPATH=$CDPATH:/work/nu
export CDPATH=$CDPATH:/work/nu/repo
export CDPATH=$CDPATH:/work/nu/infra
export CDPATH=$CDPATH:/work/dev
export CDPATH=$CDPATH:/work/devops
export CDPATH=$CDPATH:/work/devops/puppet/global
export CDPATH=$CDPATH:/pub

# source /usr/local/lib/python2.7//site-packages/Powerline-beta-py2.7.egg/powerline/bindings/bash/powerline.sh

# NuBank
rvm use default
awsenv-set nu
source ~/bash.d/43-aws-nu.sh

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# vim: ft=sh foldlevel=0:


