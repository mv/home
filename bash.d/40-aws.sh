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
# 2022-08: refactor env VARS. Ref to aws cli v2

###
### AWS cli, python version
###
#     https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
#     https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
#     https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html
#
#     $ brew install awscli
#     or
#     $ pip3 install awscliv2
#

# 'default' as a placeholder
[ ! "${AWS_PROFILE}" ] && export AWS_PROFILE="default"

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

