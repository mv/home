#!/bin/bash

###
### mvf
### bashrc lib


# Prompt
# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#   \[\e[01;36m\]

# export yellow="\[\e[01;33m\]"
# export  white="\[\e[01;37m\]"
# export   cyan="\[\e[01;36m\]"
# export    red="\[\e[01;31m\]"
# export orange="\[\e[00;33m\]"
# export  reset="\[\e[0m\]"
#            r1='\[\e]0;\w\a\]\n'
# prompt="${yellow}\u${white}@${cyan}\h${white}:${orange}\w${reset}"

export PS1='\u@\h:\w\n\$ '
export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\]\n\$ '
export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)")\n\$ '

  # Fuctions exist?
  type __git_ps1 2>/dev/null 1>/dev/null && export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)")\n\$ '
  type __ora_ps1 2>/dev/null 1>/dev/null && export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '

  # Both exists?
  type __git_ps1 2>/dev/null 1>/dev/null && \
  type __ora_ps1 2>/dev/null 1>/dev/null && export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)") \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '


# vim: ft=sh:

