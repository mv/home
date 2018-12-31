#!/bin/bash
# vim:ft=sh:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2011-11
# 2013-10: awscli
# 2015-12: awscli: aws configure
# 2018-12: PS1 values from ~/.aws/config


###
### AWS cli, python version
###
#     http://aws.amazon.com/cli/
#     http://docs.aws.amazon.com/cli/latest/reference/
#
#     $ easy_install awscli
#     or
#     $ easy_install pip
#     $ pip install awscli
#
#     aws help
#

export AWS_PROFILE="internal-mv"
export AWS_DEFAULT_PROFILE="internal-mv"

# awsebcli: Elasticbeanstalk CLI
export AWS_EB_PROFILE="${AWS_DEFAULT_PROFILE}"

###
### PS1
###
export AWS_DEFAULT_REGION=$( egrep -A 3 ${AWS_DEFAULT_PROFILE} ~/.aws/config | head -3 | awk -F= '/region/ {print $2}' | sed -e 's/ //' )
export AWS_DEFAULT_OUTPUT=$( egrep -A 3 ${AWS_DEFAULT_PROFILE} ~/.aws/config | head -3 | awk -F= '/output/ {print $2}' | sed -e 's/ //' )

function __aws_config() {
  # add to the prompt:
  [ "${AWS_DEFAULT_PROFILE}" ] && msg="${AWS_DEFAULT_PROFILE}"
  [ "${AWS_DEFAULT_REGION}"  ] && msg="${msg}:${AWS_DEFAULT_REGION}"
  echo "[aws:${msg}]"
}


###
### bash-completion
###

if which aws_completer 2>/dev/null 1>/dev/null
then
  complete -C aws_completer aws
  if which _fzf-completer.sh 2>&1 > /dev/null
  then complete -C ~/bin/_fzf-completer.sh aws
  fi
fi


