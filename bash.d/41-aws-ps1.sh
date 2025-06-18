#!/bin/bash
# vim: ft=sh:ts=2:sts=2:et:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: add 'account-id' because of AWS SSO/multiple accounts
# 2024-01: simplify colors

_bashrc_verbose "== AWS/PS1"

###
### PS1: show in the prompt what is defined by aws/config chosen profile
###

function __aws_ps1() {

  ##
  ## Profile
  ##
  [ "${AWS_PROFILE}" == "" ] && return

  ##
  ## Config
  ##
  # no quotes: expand tilde to match comparison
  _default=~/.aws/config

  # sanity check: if custom defined, must exists
  if [ "${AWS_CONFIG_FILE}" == "" ]
  then  AWS_CONFIG_FILE=${_default}
  fi

  if [ ! -e "${AWS_CONFIG_FILE}" ]
  then echo -ne "${red}[aws:cfg_not_found]${reset}" ; return
  fi

  # '_config_show': show CONFIG_FILE in prompt if different from default
  _config_show=""
  if [ "${AWS_CONFIG_FILE}" != "${_default}" ]
  then
    _filename=${AWS_CONFIG_FILE##*/}
    _dir_full=${AWS_CONFIG_FILE%/*}
    _dir_last=${_dir_full##*/}
    _config_show="${_dir_last}/${_filename}"
  fi


  ##
  ## Parsing
  ##

  # awk 1: capture text between /regex-1/,/regex-2/
  # awk 2: separate k/v pair by '='
  #
  # _profile_section:
  #   awk "/^\[profile ${AWS_PROFILE}\]/,/^$/"   ${AWS_CONFIG_FILE}


  _aws_region=$( \
    awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" ${AWS_CONFIG_FILE} | \
    awk -F= '/^region/ {print $2}' \
  )

  if [ "${_aws_region}" == "" ]
  then _aws_region="null"
  else _aws_region=$( echo "${_aws_region}" | sed -e 's/ //' )
  fi


  _aws_account=$( \
    awk "/^\[profile ${AWS_PROFILE}\]/,/^$/" ${AWS_CONFIG_FILE} | \
    awk -F= '/account_/ {print $2}' \
  )

  if [ "${_aws_account}" == "" ]
  then : # null: using simple credentials
  else _aws_account=$( echo "${_aws_account}" | sed -e 's/ //' )
  fi


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
  [ "${_aws_account}" ] && _ps1="${_ps1}:sso:${cyan}${_aws_account}${reset}"
  [ "${_config_show}" ] && _ps1="${_ps1}:${_config_show}"

# echo "[aws:${_ps1}]"
  echo -ne "${reset}[${_ps1}${orange}${reset}]"

}

