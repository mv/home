#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
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

