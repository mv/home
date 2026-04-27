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


function aws-account-id() {
  aws sts get-caller-identity --query "Account" --output text
}
_bashrc_info "-- Sourcing: defined: [aws-account_id]"


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

function aws-ami-list() {

  if [ "${1}" == "" ]
  then
    echo
    echo "Usage: aws-ami-list ami_name"
    echo
  else
    _ami_name="${1}"
    aws ec2 describe-images \
        --filters "Name=name,Values=*${_ami_name}*" \
        --query   'Images[][Name,ImageId,OwnerId,ImageOwnerAlias,CreationDate]' \
        --owners  'self' \
        --output text | column -t | sort -k 5 -r
  fi

}
_bashrc_info "-- Sourcing: defined: [aws-ami-list]"

function aws-ec2-userdata() {

  if [ "${1}" == "" ]
  then
    echo
    echo "Usage: aws-ec2-userdata instance_id"
    echo
  else
    _instance_id="${1}"
    aws ec2 describe-instance-attribute \
      --instance-id "${_instance_id}"   \
      --attribute userData --query "UserData.Value" \
      --output text \
      | base64 --decode
  fi

}
_bashrc_info "-- Sourcing: defined: [aws-ec2-userdata]"

function aws-vpc-list() {
  aws ec2 describe-vpcs --query 'Vpcs[].[OwnerId,VpcId,CidrBlock,IsDefault,Tags[?Key==`Name`].Value|[0]]' --output text
}
_bashrc_info "-- Sourcing: defined: [aws-vpc-list]"


function aws-subnet-list() {
  aws ec2 describe-subnets --query 'Subnets[].[OwnerId,VpcId,SubnetId,AvailabilityZone,AvailabilityZoneId,CidrBlock,State,Tags[?Key==`Name`].Value|[0]]' --output text | sort -k 8
}
_bashrc_info "-- Sourcing: defined: [aws-subnet-list]"


function aws-sg-list() {
  aws ec2 describe-security-groups --query 'SecurityGroups[].[VpcId,GroupId,Tags[?Key==`Name`].Value|[0]]' --output text | sort -k 3
}
_bashrc_info "-- Sourcing: defined: [aws-sg-list]"


function aws-ec2-list() {
  aws ec2 describe-instances \
      --query 'Reservations[].[Instances][][][].[Tags[?Key==`Name`].Value|[0],InstanceId,VpcId,SubnetId,PrivateIpAddress,InstanceType,VirtualizationType,Architecture, LaunchTime,State.Name]' \
      --output text | grep -i running | column -t | sort -k 2

}
_bashrc_info "-- Sourcing: defined: [aws-ec2-list]"


function aws-instance-profile-list() {
  aws iam list-instance-profiles --query 'InstanceProfiles[].[InstanceProfileName,Arn,CreateDate]' --output text | column -t
}
_bashrc_info "-- Sourcing: defined: [aws-instance-profile-list]"
