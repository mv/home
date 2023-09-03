#!/bin/bash
# vim:ft=sh:
#
# Helper to `aws sso login`
#   aws-sso-login <profile-name>
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2023-02
#

###
###
###

function aws-sso-login() {

  if [ "${1}" == "" ]
  then
    echo "Usage: aws-sso-login <profile-name>"
    echo
    echo "  Reads SSO info from ~/.aws/config"
    echo
  else
    aws sso login --profile="${1}"
  fi

}

