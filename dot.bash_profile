#!/bin/bash
# vim: ft=sh:ts=4:sts=4:et:

###
### mvf
### macos:~/.profile

# [ -e ~/.bashrc-debug   ] && echo "[~/.bashrc]: found: ~/.bashrc-debug"
# [ -e ~/.bashrc-verbose ] && echo "[~/.bashrc]: found: ~/.bashrc-verbose"
export _BASHRC_VERBOSE="true"
export _BASHRC_DEBUG="false"

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


PS1='\u@\h:\w\n\$ '

function echo_source() {
	echo "$1" && source "$1"
}

###
### My Bash 'modules'
###

for file in ~/bash.d/*sh
do
    # only executables
    if [ -x "${file}" ]
    then source "${file}"
    fi
done

# if interative and exists...
[[ $- == *i* ]] && [[ -e ~/.bashrc ]] && source ~/.bashrc
