#!/bin/bash
# vim:ft=sh:

###
### mvf
### macos:~/.profile

[ -e ~/.shell-debug-enable ] && echo "~/.shell-debug-enable: [~/.bash_profile]"

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
    [ -x "$file" ] && source "$file"
done

# if interative and exists...
[[ $- == *i* ]] && [[ -e ~/.bashrc ]] && source ~/.bashrc

###
### Add-ons
###
##[ -f /usr/local/Cellar/coreutils/8.5/aliases         ] && echo_source /usr/local/Cellar/coreutils/8.5/aliases



# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


