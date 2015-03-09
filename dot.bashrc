#!/bin/bash
# vim: ft=sh foldlevel=0:

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
export CDPATH=$CDPATH:~/work
export CDPATH=$CDPATH:~/work/mv
export CDPATH=$CDPATH:~/work/mv/dev
export CDPATH=$CDPATH:/pub

# source /usr/local/lib/python2.7//site-packages/Powerline-beta-py2.7.egg/powerline/bindings/bash/powerline.sh

# Ruby!
rvm use default

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /Users/marcus/.travis/travis.sh ] && source /Users/marcus/.travis/travis.sh

