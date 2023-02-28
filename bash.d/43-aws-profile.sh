#!/bin/bash
# vim:ft=sh:
#
# aws-profile [<profile-name>]
#   View/change AWS_PROFILE  
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2023-02
#

###
###
###

function aws-profile() {

  if [ "${1}" == "-l" ]
  then 
    grep "^\[profile" ~/.aws/config | sort
    return 0
  fi

  if ! [ "${1}" == "" ]
  then
    export AWS_PROFILE="${1}"
  fi

  echo
  echo "AWS_PROFILE='${AWS_PROFILE}'" 
  echo
}

