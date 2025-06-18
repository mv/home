#!/bin/bash
# vim:ft=sh:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: add 'account-id' because of AWS SSO/multiple accounts

###
### PS1: show in the prompt what is defined by aws/config chosen profile
###

function __aws_ps1() {

  if [ "${AWS_CONFIG_FILE}" == "" ]
  then AWS_CONFIG_FILE=~/.aws/config
  fi

  if [ ! -f ~/.aws/config ]
  then
    echo ''
    return
  fi

  # awk 1: capture text between /regex-1/,/regex-2/
  # awk 2: separate k/v pair by '='

  _aws_region=$(  \
    if [ "${AWS_REGION}" == "" ] ; \
    then awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" "${AWS_CONFIG_FILE}" | awk -F= '/^region/ {print $2}' | sed -e 's/ //' ; \
    else echo "${AWS_REGION}" ; \
    fi
  )

  _aws_account=$( \
    awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" "${AWS_CONFIG_FILE}" | \
    awk -F= '/^sso_account_id/ {print $2}' | sed -e 's/ //'  \
  )

  _aws_role=$( \
    awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" "${AWS_CONFIG_FILE}" | \
    awk -F= '/^role_arn/ {print $2}' | sed -e 's/ //'      | \
    sed -e 's/arn:aws:iam:://' \
  )

  #
  # build the prompt:
  #
  [ "${AWS_PROFILE}" ]        && _ps1="${AWS_PROFILE}"
  [ "${AWS_ACCESS_KEY_ID}" ]  && _ps1="aws_access_key"  # overwrites

  # keep adding...
  [ "${_aws_region}" ]  && _ps1="${_ps1}:${_aws_region}"
  [ "${_aws_account}" ] && _ps1="${_ps1}:${_aws_account}"
  [ "${_aws_role}"    ] && _ps1="${_ps1}:${_aws_role}"
  echo "[aws:${_ps1}]"
}
