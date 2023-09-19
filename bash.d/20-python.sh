#!/bin/bash
# vim: ft=sh:

###
### mvf
### Python

# Disable __pycache__ dirs
export PYTHONDONTWRITEBYTECODE=1

# pip install
# https://pip.pypa.io/en/latest/topics/configuration/#location
#   Global: /etc/xdg/pip/pip.conf
#   Global: /etc/pip.conf
#   User:   $HOME/.config/pip/pip.conf
#   Site:   $VIRTUAL_ENV/pip.conf
export PIP_CONFIG_FILE="${HOME}/pip.conf"

# Tip: pip completion
# pip completion --bash > ~/bash_completion.d/pip.bash-completion

# pyenv
# https://github.com/pyenv/pyenv
# export PYENV_ROOT=~/.pyenv
if which pyenv 2>/dev/null 1>/dev/null
then eval "$(pyenv init -)"
fi


# pipenv: Pipfile.lock
export PIPENV_VERBOSITY=-1


# virtualenv
alias pyactivate="source venv/bin/activate"
alias pydeactivate="deactivate"

export VIRTUAL_ENV_DISABLE_PROMPT=1

#
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
   brown='\e[00;33m'
    blue='\e[01;34m'
 magenta='\e[01;35m'
    cyan='\e[01;36m'
   white='\e[01;37m'
    gray='\e[00;37m'
   reset='\e[0m'

function __venv_ps1() {

    if [ "${VIRTUAL_ENV}" ]
    then
#       msg = "${green}[${yellow}🐍 ${VIRTUAL_ENV##*/}${green}]"
#       echo -n '🐍 '
        echo -n "[${VIRTUAL_ENV##*/}]🐍"
    fi

}

