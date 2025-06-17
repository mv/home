#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:


##
## Troubleshooting
##

#  alias _bashrc_debug_enable="   touch ~/.bashrc-debug"
#  alias _bashrc_debug_disable="/bin/rm ~/.bashrc-debug"

function _bashrc_debug() {
#   [ -e ~/.bashrc-debug ] && echo "${@}"
    [ "${TERM_PROGRAM}"  == "vscode" ] && return 0    # skip vscode terminal
    [ "${_BASHRC_DEBUG}" == "true"   ] && echo "${@}" # do it
}

# alias _bashrc_verbose_enable="   touch ~/.bashrc-verbose"
# alias _bashrc_verbose_disable="/bin/rm ~/.bashrc-verbose"

function _bashrc_verbose() {
#   [ -e ~/.bashrc-verbose ] && echo "${@}"
    [ "${TERM_PROGRAM}"  == "vscode" ] && return 0    # skip vscode terminal
    [ "${_BASHRC_VERBOSE}" == "true" ] && echo "${@}" # do it
}

_bashrc_verbose "== Bashrc/Setup"

##
## helpers
##
function _cmd_exists() {
#   if which "${1}" 2>/dev/null 1>/dev/null
    if which "${1}" &>/dev/null
    then
        _bashrc_debug "_cmd_exists: FOUND: [${1}]"
        return 0  # found
    else
        _bashrc_debug "_cmd_exists: NOT FOUND: [${1}]"
        return 1  # not found
    fi
}


##
## colors
##
#
# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37

export     red='\e[01;31m'
export   green='\e[01;32m'
export  yellow='\e[01;33m'
export   brown='\e[00;33m'
export    blue='\e[01;34m'
export magenta='\e[01;35m'
export    cyan='\e[01;36m'
export   white='\e[01;37m'
export    gray='\e[00;37m'
export   reset='\e[0m'
