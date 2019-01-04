#!/bin/bash
# vim: ft=sh:

###
### mvf
### Python

# pyenv
# https://github.com/pyenv/pyenv

# export PYENV_ROOT=~/work/dev/pyenv
# export PYENV_ROOT=~/.pyenv
# eval "$(pyenv init -)"

# Disable __pycache__ dirs
export PYTHONDONTWRITEBYTECODE=1

# virtualenv
alias pyactivate="source .venv/bin/activate"
alias pydeactivate="deactivate"


# Tip: pip completion
# pip completion --bash > ~/bash_completion.d/pip.bash-completion

