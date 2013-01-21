#!/bin/bash
### mvf
### bashrc lib

# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white

# Ref: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37

     red="\[\e[01;31m\]"
   green="\[\e[01;32m\]"
  yellow="\[\e[01;33m\]"
  orange="\[\e[00;33m\]"
    blue="\[\e[01;34m\]"
 magenta="\[\e[01;35m\]"
    cyan="\[\e[01;36m\]"
   white="\[\e[01;37m\]"
   reset="\[\e[0m\]"

# Example
# export PS1='\u@\h:\w\n\$ '
# export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\]\n\$ '
# export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)")\n\$ '

# Default
prompt="export PS1='${yellow}\\u${white}@${cyan}\\h${white}:${orange}\\w/"

# Fuctions exist?
# type __ora_ps1    2>/dev/null 1>/dev/null && prompt="`echo $prompt ${red}``echo '$(__ora_ps1)'`"
# type __mysql_ps1  2>/dev/null 1>/dev/null && prompt="`echo $prompt ${cyan}``echo '$(__mysql_ps1)'`"
# type __rvm_ps1    2>/dev/null 1>/dev/null && prompt="`echo $prompt ${red}``echo '$(__rvm_ps1)'`"
  type __git_ps1    2>/dev/null 1>/dev/null && prompt="`echo $prompt ${green}``echo '$(__git_ps1 "(%s)")'`"
  type __awsenv_ps1 2>/dev/null 1>/dev/null && prompt="`echo $prompt ${cyan}``echo '$(__awsenv_ps1)'`"

# Terminal tab string
function __term_string() {
   #echo -ne "\033]0;String_Here\007"
    echo -ne "\033]0;${PWD##*/}/\007"
}
prompt="`echo ${prompt}``echo '$(__term_string)'`"

# End colors and evaluate
prompt="$prompt $reset\n\\$ '"
eval $prompt

export PS2="\[\033[0;40m\]\[\033[0;33m\]> \[\033[1;37m\]\[\033[1m\]"

# vim: ft=sh:

