#!/bin/bash
# vim: ft=sh foldlevel=0:

###
### mvf
### macos:~/.bashrc

[ -e ~/.shell-debug-enable ] && echo "~/.shell-debug-enable: [~/.bashrc]"

## no '/' in the end
export    TF_LIVE_DIR=~/work/inoa/live-at
export TF_MODULES_DIR=~/work/inoa/tf

export at_current=${TF_LIVE_DIR}/at-saas/sandbox/tst/bulkhead-01

alias cdl="cd ${TF_LIVE_DIR}"
alias cdm="cd ${TF_MODULES_DIR}"

alias cdc="cd ${at_current}"

if  which direnv &>/dev/null
then
    echo "Direnv: loading"
    eval "$(direnv hook bash)"
fi

export CDPATH=~/work/inoa:${CDPATH}

