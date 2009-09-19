#!/bin/bash

###
### mvf
### macos:~/.bashrc

###
### Modules
###
  [  -f  ~/bin/bashrc.path.sh          ]  &&  .       ~/bin/bashrc.path.sh

  [  -f  ~/bin/bashrc.cmd-utils.sh     ]  &&  .       ~/bin/bashrc.cmd-utils.sh
  [  -f  ~/bin/bashrc.dev.sh           ]  &&  .       ~/bin/bashrc.dev.sh
  [  -f  ~/bin/bashrc.du-utils.sh      ]  &&  .       ~/bin/bashrc.du-utils.sh
  [  -f  ~/bin/bashrc.filedir.sh       ]  &&  .       ~/bin/bashrc.filedir.sh
  [  -f  ~/bin/bashrc.ls.sh            ]  &&  .       ~/bin/bashrc.ls.sh
  [  -f  ~/bin/bashrc.macosx.sh        ]  &&  .       ~/bin/bashrc.macosx.sh
  [  -f  ~/bin/bashrc.vim.sh           ]  &&  .       ~/bin/bashrc.vim.sh
  [  -f  ~/bin/bashrc.ps1.sh           ]  &&  .       ~/bin/bashrc.ps1.sh

  [  -f  ~/bin/oracle.rc.sh            ]  &&  source  ~/bin/oracle.rc.sh
  [  -f  ~/bin/oracle.alias.rc.sh      ]  &&  source  ~/bin/oracle.alias.rc.sh
# [  -f  ~/bin/bashrc.oracle.r11i.sh   ]  &&  source  ~/bin/bashrc.oracle.r11i.sh

  [  -f  ~/bin/bashrc.job-abd.sh       ]  &&  .       ~/bin/bashrc.job-abd.sh

###
### Add-ons
###
  [ -f /opt/local/etc/bash_completion          ] && source /opt/local/etc/bash_completion
  [ -f /opt/local/etc/profile.d/cdargs-bash.sh ] && source /opt/local/etc/profile.d/cdargs-bash.sh

# [ -f ~/bin/git-completion.sh                 ] && source ~/bin/git-completion.sh

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cmdhist          # saves multines in one history line
shopt -s mailwarn         # check mailfile

export CDPATH=.:~:/work:/work/mv-dba:/work/webcointernet:/public
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'
export HISTCONTROL='ignoredups:erasedups'

alias rehash='source ~/.bashrc'

set -o vi
umask 002

# vim: ft=sh foldlevel=0:

