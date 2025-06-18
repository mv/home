#!/bin/bash
# vim:ft=sh:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: add 'account-id' because of AWS SSO/multiple accounts
# 2024-01: simplify colors

###
### PS1: show in the prompt what is defined by aws/config chosen profile
###

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

function __aws_ps1() {

  # no quotes: expand tilde
  _default=~/.aws/config

  # show CONFIG_FILE if different from default
  if [ "${AWS_CONFIG_FILE}" == "${_default}" ]
  then _ps1=""
  else
    _filename=${AWS_CONFIG_FILE##*/}
    _dir_full=${AWS_CONFIG_FILE%/*}
    _dir_last=${_dir_full##*/}
#   _ps1="cfg:${_dir_last}/${_filename}:"
    _config_file="${_dir_last}/${_filename}"
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

  case ${_aws_region} in
    'sa-east-1') _color=${yellow} ;;
    'us-east-1') _color=${brown}  ;;
    'us-east-2') _color=${green}  ;;
    'us-west-*') _color=${magenta};;
    'eu-*'     ) _color=${blue}   ;;
              *) _color=${red}    ;;
  esac


  #
  # build the prompt:
  #
# [ "${AWS_PROFILE}"  ] && _ps1="${_ps1}prf:${AWS_PROFILE}"
  [ "${AWS_PROFILE}"  ] && _ps1="${cyan}${AWS_PROFILE}${reset}"
  [ "${_aws_region}"  ] && _ps1="${_ps1}:${_color}${_aws_region}${reset}"
  [ "${_aws_account}" ] && _ps1="${_ps1}:sso:${_aws_account}"
  [ "${_config_file}" ] && _ps1="${_ps1}:${_config_file}"

# echo "[aws:${_ps1}]"
  echo -ne "[${_ps1}]"

}

