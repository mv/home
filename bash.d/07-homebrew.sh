#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib


# homebrew
#   Linux
#   MacOS X

if [ -d /home/linuxbrew/.linuxbrew ]
then :
  _bashrc_verbose "== Homebrew/Linux"

# pathadd /home/linuxbrew/.linuxbrew/bin after
  pathadd /home/linuxbrew/.linuxbrew/bin 

elif [ -d /opt/homebrew/bin ]
then :
  _bashrc_verbose "== Homebrew/MacOS X/Arm"

  # pathadd in 01-path.sh

elif [ -f /usr/local/bin/brew ]
then :
  _bashrc_verbose "== Homebrew/MacOS X/Intel"

  # pathadd in 01-path.sh
else :
  return
fi




