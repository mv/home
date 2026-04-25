#!/bin/bash
# vim: ft=sh:ts=2:sts=2:et:
#
# Collected shortcuts
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: collection


if _cmd_exists aws
then :
  _bashrc_info "== AWS/Shortcuts"
else :
  return
fi

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
_bashrc_info "-- Sourcing: defined: [aws-r53-list]"


function aws-get-caller-identity() {
  aws sts get-caller-identity --query "Account" --output text
}
_bashrc_info "-- Sourcing: defined: [aws-get-caller-identity]"


function aws-account-list() {
  aws organizations list-accounts --query Accounts[].[Id,Name] --output text | sort -k 2
}
_bashrc_info "-- Sourcing: defined: [aws-account-list]"


function aws-ssm-parameters-list() {
  aws ssm describe-parameters --query Parameters[].Name --output json
}
_bashrc_info "-- Sourcing: defined: [aws-ssm-parameters-list]"


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
_bashrc_info "-- Sourcing: defined: [aws-ssm-parameters-scan]"

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
_bashrc_info "-- Sourcing: defined: [aws-ssm-parameters-values]"


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
_bashrc_info "-- Sourcing: defined: [aws-ssm-connection-info]"

function aws-ssm-start-session() {
  if [ "${1}" == "" ]
  then
    echo
    echo "Usage: aws-ssm-start-seesion instance-id"
    echo
  else
    aws ssm start-session --target "${1}"
  fi
}
_bashrc_info "-- Sourcing: defined: [aws-ssm-start-session]"

function aws-ssm-list-session() {
  if [ "${1}" == "-h" ]
  then
    echo
    echo "Usage: aws-ssm-list-session instance-id"
    echo
  else
    aws ssm describe-sessions --state Active --query 'Sessions[].[Target,Status,SessionId]' --output text
  fi
}
_bashrc_info "-- Sourcing: defined: [aws-ssm-list-session]"

function aws-ssm-term-session() {
  if [ "${1}" == "" ]
  then
    echo
    echo "Usage: aws-ssm-term-session instance-id"
    echo
  else
    aws ssm terminate-session --session-id "${1}"
  fi
}
_bashrc_info "-- Sourcing: defined: [aws-ssm-term-session]"

function aws-ssm-term-all() {
  if [ "${1}" != "-y" ]
  then
    echo
    echo "Usage: aws-ssm-term-all -y"
    echo
  else
    aws-ssm-list-session | awk '{print $3}' | while read s
    do echo aws-ssm-term-session $s
    done
  fi
}
_bashrc_info "-- Sourcing: defined: [aws-ssm-term-session]"

function aws-ec2-list() {
  if [ "${1}" == "-h" ]
  then
    echo
    echo "Usage: aws-ec2-list -h"
    echo
  else
    aws ec2 describe-instances \
        --query 'Reservations[*].Instances[].[InstanceId,LaunchTime,State.Name,Tags[?Key==`Name`].Value|[0]]' \
        --output text | column -t |sort -k 3 \
    # echo ${_output} | jq
  fi
}
_bashrc_info "-- Sourcing: defined: [aws-ec2-list]"

function aws-elbv2-list() {
  if [ "${1}" == "-h" ]
  then
    echo
    echo "Usage: aws-elbv2-list -h"
    echo
  else
    aws elbv2 describe-load-balancers \
        --query 'LoadBalancers[].[LoadBalancerName,Type,Scheme,DNSName]' \
        --output text | column -t | sort
  fi
}
_bashrc_info "-- Sourcing: defined: [aws-ec2-list]"




function aws-sts-assume-svc() {
  aws sts assume-role --role-arn ${job_role_name} --role-session-name ${job_role_session}
}
_bashrc_info "-- Sourcing: defined: [aws-sts-assume-svc]"

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

_bashrc_info "-- Sourcing: defined: [aws-sso-login]"
