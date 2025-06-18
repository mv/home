#!/bin/bash
# vim: ft=sh:ts=2:sts=2:et:
#
# Collected shortcuts
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: collection

_bashrc_verbose "== AWS/Shortcuts"

###
### Shortcuts
###
function aws-r53-list() {
  aws route53 list-hosted-zones --output text| grep hosted | awk '{print $4}' | \
  while read z
  do
    echo $z
    aws route53 get-hosted-zone --id $z --output json | grep '"Name"|ns-'
  done
}
echo "== Sourcing: defined: [aws-r53-list]"


function aws-get-caller-identity() {
  aws sts get-caller-identity --query "Account" --output text
}
echo "== Sourcing: defined: [aws-get-caller-identity]"


function aws-account-list() {
  aws organizations list-accounts --query Accounts[].[Id,Name] --output text | sort -k 2
}
echo "== Sourcing: defined: [aws-account-list]"


function aws-ssm-parameters-list() {
  aws ssm describe-parameters --query Parameters[].Name --output json
}
echo "== Sourcing: defined: [aws-ssm-parameters-list]"


function aws-ssm-parameters-scan() {
  [ "${1}" == "" ] && {
    echo
    echo "Usage: aws-ssm-parameters-scan <parameter-name>"
    echo
    return 1
  }
  aws ssm describe-parameters --query Parameters[].Name --output json \
  | grep "${1}"  \
  | tr -d ',[]" ' \
  | while read _ssm
  do
    # skip whitelines
    [ "${_ssm}" == "" ] && continue

    _value=$( aws ssm get-parameter --name ${_ssm} --query Parameter.Value )

    echo "SSM Parameter Name : [${_ssm}]"
    echo "SSM Parameter Value: [${_value}]"
    echo
  done
}
echo "== Sourcing: defined: [aws-ssm-parameters-scan]"

function aws-ssm-parameters-values() {
  aws ssm describe-parameters --query Parameters[].Name --output json \
  | tr -d ',[]" ' \
  | while read _ssm
  do
    [ "${_ssm}" == "" ] && continue

    _value=$( aws ssm get-parameter --name ${_ssm} --query Parameter.Value )

    echo "SSM Parameter Name : [${_ssm}]"
    echo "SSM Parameter Value: [${_value}]"
    echo
  done
}
echo "== Sourcing: defined: [aws-ssm-parameters-values]"


function aws-ssm-connection-info() {
  if [ "${1}" == "" ]
  then
    echo
    echo "Usage: aws-ssm-connection-info /ssm/path/"
    echo
  else
    _output=$(aws ssm get-parameter --name "${1}" --with-decryption --query Parameter.Value --output json | jq -r)
    echo ${_output} | jq
  fi
}
echo "== Sourcing: defined: [aws-ssm-connection-info]"

function aws-sts-assume-svc() {
  aws sts assume-role --role-arn ${job_role_name} --role-session-name ${job_role_session}
}
echo "== Sourcing: defined: [aws-sts-assume-svc]"
