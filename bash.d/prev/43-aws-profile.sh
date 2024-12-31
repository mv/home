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

  if ! [ "${1}" == "" ]
  then
    export AWS_PROFILE="${1}"
  fi

  echo
  echo "AWS_PROFILE='${AWS_PROFILE}'" 
  echo
}
