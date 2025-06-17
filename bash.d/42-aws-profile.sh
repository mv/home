#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
#
# aws-profile [<profile-name>] | -l | -d
#   View/change AWS_PROFILE
#   -d  details of current profile
#   -l  list all profiles
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2023-02
#

function aws-profile() {

  # -l: list all profiles
  if [ "${1}" == "-l" ]
  then
    grep "^\[profile" ${AWS_CONFIG_FILE} | sort
    return 0
  fi

  # -d: details of current profile
  if [ "${1}" == "-d" ]
  then
    # capture text between /regex-1/,/regex-2/
    awk "/^\[profile ${AWS_PROFILE}\]/ , /^$/"  ${AWS_CONFIG_FILE}
    return 0
  fi

  # set to new profile
  if [ "${1}" != "" ]
  then export AWS_PROFILE="${1}"
  fi

  echo
  echo "  AWS_PROFILE='${AWS_PROFILE}'"
  echo
}


# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial
function _complete-aws-profile() {
  _profiles="$( awk '/^\[profile/ {print $2}' ~/.aws/config | tr -d ']' )"
  COMPREPLY=( $(compgen -W "${_profiles}" "${COMP_WORDS[1]}") )
}

complete -F _complete-aws-profile  aws-profile
