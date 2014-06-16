#!/bin/bash

# Ref: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white

# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37

     red='\e[01;31m'
   green='\e[01;32m'
  yellow='\e[01;33m'
  orange='\e[00;33m'
    blue='\e[01;34m'
 magenta='\e[01;35m'
    cyan='\e[01;36m'
   white='\e[01;37m'
    gray='\e[00;37m'
   reset='\e[0m'

# Default
PS1="${yellow}\u${white}@${cyan}\H${white}:${orange}\w${reset}\n\\$ "
PS2="${yellos}> ${reset}"

# Dynamically, if possible
prompt="${yellow}\u${white}@${cyan}\H${white}:${orange}\w"
marker="${prompt}"

# Fuctions exist?
# type __ora_ps1    &>/dev/null && prompt="${prompt} ${red}\$(__ora_ps1)"
# type __mysql_ps1  &>/dev/null && prompt="${prompt} ${cyan}\$(__mysql_ps1)"
  type __rvm_ps1    &>/dev/null && prompt="${prompt} ${red}\$(__rvm_ps1)"
  type __git_ps1    &>/dev/null && prompt="${prompt} ${green}\$(__git_ps1 \"(%s)\")"
  type __awsenv_ps1 &>/dev/null && prompt="${prompt} ${cyan}\$(__awsenv_ps1)"

if [ "${prompt}" != "${marker}" ]
then
  # Close (and adopt) dynamic prompt
  PS1="${prompt}${reset}\n\\$ "
fi

export PS1 PS2

# vim: ft=sh:

