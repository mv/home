#!/bin/bash

###
### mvf
### macos:~/.bashrc

###
### Modules
###
  [  -f  ~/bin/bashrc.path.sh          ]  &&  .       ~/bin/bashrc.path.sh

  [  -f  ~/bin/bashrc.alias.sh         ]  &&  .       ~/bin/bashrc.alias.sh
  [  -f  ~/bin/bashrc.du-utils.sh      ]  &&  .       ~/bin/bashrc.du-utils.sh
  [  -f  ~/bin/bashrc.filedir.sh       ]  &&  .       ~/bin/bashrc.filedir.sh
  [  -f  ~/bin/bashrc.ls.sh            ]  &&  .       ~/bin/bashrc.ls.sh
  [  -f  ~/bin/bashrc.netproc.sh       ]  &&  .       ~/bin/bashrc.netproc.sh

  [  -f  ~/bin/bashrc.dev.sh           ]  &&  .       ~/bin/bashrc.dev.sh
  [  -f  ~/bin/bashrc.macosx.sh        ]  &&  .       ~/bin/bashrc.macosx.sh
# [  -f  ~/bin/bashrc.mysql.sh         ]  &&  .       ~/bin/bashrc.mysql.sh
  [  -f  ~/bin/bashrc.perl.sh          ]  &&  .       ~/bin/bashrc.perl.sh
  [  -f  ~/bin/bashrc.rails.sh         ]  &&  .       ~/bin/bashrc.rails.sh
  [  -f  ~/bin/bashrc.vim.sh           ]  &&  .       ~/bin/bashrc.vim.sh

  [  -f  ~/bin/bashrc.job-abd.sh       ]  &&  .       ~/bin/bashrc.job-abd.sh

  [  -f  ~/bin/oracle.client.rc.sh     ]  &&  source  ~/bin/oracle.client.rc.sh
# [  -f  ~/bin/oracle.db.rc.sh         ]  &&  source  ~/bin/oracle.db.rc.sh
# [  -f  ~/bin/oracle.alias.rc.sh      ]  &&  source  ~/bin/oracle.alias.rc.sh
# [  -f  ~/bin/bashrc.oracle.r11i.sh   ]  &&  source  ~/bin/bashrc.oracle.r11i.sh

  [  -f  ~/bin/bashrc.ps1.sh           ]  &&  .       ~/bin/bashrc.ps1.sh

###
### Add-ons
###
  [ -f ~/bin/git-completion.sh                         ] && source ~/bin/git-completion.sh
  [ -f /usr/local/etc/bash_completion                  ] && source /usr/local/etc/bash_completion
# [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && source /usr/local/etc/bash_completion.d/cdargs-bash.sh
# [ -f /usr/local/Cellar/coreutils/8.5/aliases         ] && source /usr/local/Cellar/coreutils/8.5/aliases

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
shopt -s mailwarn         # check mailfile

export CDPATH=.:~:/work:/work/abd:/work/abd/alx:/work/mv-dba:/pub
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'
export HISTCONTROL='ignoredups:erasedups'

alias rehash='source ~/.bashrc'

function gpass() {
    grep -i -n "$1" /work/mv-priv/pass/pass.txt
}

set -o vi
umask 002

[  -f  ~/bin/bashrc.ps1.sh           ]  &&  .       ~/bin/bashrc.ps1.sh

# vim: ft=sh foldlevel=0:


