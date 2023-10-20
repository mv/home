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

  # no quotes: expand tilde
  _default=~/.aws/config

  # show CONFIG_FILE if different from default
  if [ "${AWS_CONFIG_FILE}" == "${_default}" ]
  then _ps1=""
  else _ps1="cfg:${AWS_CONFIG_FILE}:"
  fi

  # awk 1: capture text between /regex-1/,/regex-2/
  # awk 2: separate k/v pair by '='

  _aws_region=$(  \
    awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" ${AWS_CONFIG_FILE} | \
    awk -F= '/^region/ {print $2}' | sed -e 's/ //'          \
  )

  _aws_account=$( \
    awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" ${AWS_CONFIG_FILE} | \
    awk -F= '/^sso_account_id/ {print $2}' | sed -e 's/ //'  \
  )

  #
  # build the prompt:
  #
  [ "${AWS_PROFILE}" ]  && _ps1="${_ps1}prf:${AWS_PROFILE}"
  [ "${_aws_region}" ]  && _ps1="${_ps1}:${_aws_region}"
  [ "${_aws_account}" ] && _ps1="${_ps1}:sso:${_aws_account}"

# echo "[aws:${_ps1}]"
  echo "[${_ps1}]"

}

