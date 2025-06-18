#!/bin/bash
# vim: ft=sh:ts=2:sts=2:et:

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


#xport PS1=""u@\h:\w\n\\$ "  # root fallback
export PS1='\u@\h:\w\n\$ '

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
