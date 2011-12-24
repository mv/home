#!/bin/bash

###
### mvf
### macos:~/.bashrc

PS1='\u@\h:\w\n\$ '

function echo_source() {
	echo "$1" && source "$1"
}

###
### My Bash 'modules'
###

for file in ~/bash.d/*sh
do
    [ -x "$file" ] && source "$file"
done

[ -e ~/.bashrc ] && source ~/.bashrc

###
### Add-ons
###
# [ -f /usr/local/Cellar/coreutils/8.5/aliases         ] && echo_source /usr/local/Cellar/coreutils/8.5/aliases

# BASH_COMPLETION_DEBUG=1
  [ -f /usr/local/etc/bash_completion                  ] &&      source /usr/local/etc/bash_completion
# [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && echo_source /usr/local/etc/bash_completion.d/cdargs-bash.sh

# vim:ft=sh:

