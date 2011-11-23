#!/bin/bash

###
### mvf
### macos:~/.bashrc

echo_source() {
    echo "$@"
    time source "$@"
    echo
}

###
### My Bash 'modules'
###

for file in ~/bash.d/*sh
do
    [ -x "$file" ] && echo "$file" && source "$file"
done

# Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

export CDPATH=.:~:/work:/work/wip:/work/abd:/work/abd/alx:/work/mv-dba:/pub
export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

alias rehash='source ~/.bashrc'

function gpass() {
    grep -i -n "$1" /work/mv-priv/pass/pass.txt
}

###
### Add-ons
###
  [ -f ~/bin/git-completion.sh                         ] &&      source ~/bin/git-completion.sh
# [ -f /usr/local/Cellar/coreutils/8.5/aliases         ] && echo_source /usr/local/Cellar/coreutils/8.5/aliases

# BASH_COMPLETION_DEBUG=1
  [ -f /usr/local/etc/bash_completion                  ] &&      source /usr/local/etc/bash_completion
# [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && echo_source /usr/local/etc/bash_completion.d/cdargs-bash.sh


set -o vi
umask 002

# vim: ft=sh foldlevel=0:


