#!/bin/bash
# vim: ft=sh:

###
### mvf
### Python

# Disable __pycache__ dirs
export PYTHONDONTWRITEBYTECODE=1

# Tip: pip completion
# pip completion --bash > ~/bash_completion.d/pip.bash-completion

# virtualenv
alias pyactivate="source venv/bin/activate"
alias pydeactivate="deactivate"

# pyenv
# https://github.com/pyenv/pyenv
# export PYENV_ROOT=~/.pyenv
eval "$(pyenv init -)"

# pipenv: Pipfile.lock
export PIPENV_VERBOSITY=-1

