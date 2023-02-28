#!/bin/bash
# vim:ft=sh:
#
# aws-config [<profile-name>]
#   View a defined section from ~/.aws/config
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2023-02
#

###
###
###

function aws-config() {

  if [ "${1}" == "-l" ]
  then 
    grep "^\[profile" ~/.aws/config | sort
    return 0
  fi

  if [ "${1}" == "" ]
  then _section="${AWS_PROFILE}"
  else _section="${1}"
  fi

  # awk: capture text between /regex-1/,/regex-2/

  echo
  echo "From: ~/.aws/config"
  echo "-------------------"
  echo
  awk "/^\[profile ${_section}\]/,/^$/" ~/.aws/config

}

