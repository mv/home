#!/bin/bash
# vim: ft=sh foldlevel=0:

###
### mvf
### macos:~/.bashrc

[ -e ~/.shell-debug-enable ] && echo "~/.shell-debug-enable: [~/.bashrc]"

## no '/' in the end
export    TF_LIVE_DIR=/mnt/c/Users/MarcusViniciusFerrei/work/inoa/live-at
export TF_MODULES_DIR=/mnt/c/Users/MarcusViniciusFerrei/work/inoa/tf
export  TF_AT_CURRENT=${TF_LIVE_DIR}/at-saas/sandbox/tst/bulkhead-01
export  TF_AT_CURRENT=${TF_LIVE_DIR}/foundations/tgw-ng/live/sandbox-edge/us-east-2/edge

alias cdl="cd ${TF_LIVE_DIR}"
alias cdm="cd ${TF_MODULES_DIR}"
alias cdc="cd ${TF_AT_CURRENT}"


if  which direnv &>/dev/null
then
    echo "Direnv: loading"
    eval "$(direnv hook bash)"
fi

export CDPATH=~/work/inoa:${CDPATH}
