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
export TF_MODULES_DIR=/home/marcus/work/inoa/iac/tf
alias cdm="cd ${TF_MODULES_DIR}"

export  TF_AT_LIVE_DIR=/home/marcus/work/inoa/iac/at-live
export  TF_AT_CURRENT=${TF_AT_LIVE_DIR}/at-saas/prod/pool-br/us-east-2/

export TF_HUB_LIVE_DIR=/home/marcus/work/inoa/iac/hub-live
export TF_HUB_CURRENT=${TF_HUB_LIVE_DIR}/live/stg/tst/us-east-2/hub-inoa/network

alias cdl="cd ${TF_AT_LIVE_DIR}"
alias cdc="cd ${TF_AT_CURRENT}"

alias cdla="cd ${TF_AT_LIVE_DIR}"
alias cdca="cd ${TF_AT_CURRENT}"

alias cdlh="cd ${TF_HUB_LIVE_DIR}"
alias cdch="cd ${TF_HUB_CURRENT}"

# export CDPATH=~/work/inoa:${CDPATH}
# export CDPATH=~/work/inoa/iac:${CDPATH}

export    job_role_name="arn:aws:iam::617006464372:role/inoa-platform-service"
export job_role_session="INOA-Session"

# eval "$(ssh-agent -s)"


