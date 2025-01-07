#!/bin/bash
# vim: ft=sh foldlevel=0:

###
### mvf
### macos:~/.bashrc

export PS1='\u@\h:\w\n\$ '

###
### My Bash 'modules'
###
[ -e ~/.shell-debug-enable ] && echo "~/.shell-debug-enable: [~/.bashrc]"

for file in ~/bash.d/*sh
do
    # only executables
    if [ -x "$file" ]
    then
        [ -e ~/.shell-debug-enable ] && echo "[${file}]"
        source "$file"
    fi
done

## Note: 'direnv' does not work by sourcing from 'bash.d'
if  which direnv &>/dev/null
then
    echo "Direnv: loading"
    eval "$(direnv hook bash)"
fi

## Job:
## no '/' in the end
export    TF_LIVE_DIR=/mnt/c/Users/MarcusViniciusFerrei/work/inoa/live-at
export TF_MODULES_DIR=/mnt/c/Users/MarcusViniciusFerrei/work/inoa/tf

export    TF_LIVE_DIR=~/work/inoa/live-at
export TF_MODULES_DIR=~/work/inoa/tf
export  TF_AT_CURRENT=${TF_LIVE_DIR}/at-saas/sandbox/tst/bulkhead-01
export  TF_AT_CURRENT=${TF_LIVE_DIR}/foundations/tgw-ng/live/sandbox-edge/us-east-2/edge

alias cdl="cd ${TF_LIVE_DIR}"
alias cdm="cd ${TF_MODULES_DIR}"
alias cdc="cd ${TF_AT_CURRENT}"


export CDPATH=~/work/inoa:${CDPATH}

export    job_role_name="arn:aws:iam::617006464372:role/inoa-platform-service"
export job_role_session="INOA-Session"
