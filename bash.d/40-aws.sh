#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
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
# 2023-02: separate 'ps1' and 'completer'

_bashrc_verbose "== AWS"

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
[ ! "${AWS_PROFILE}" ]     && export AWS_PROFILE="default"
[ ! "${AWS_CONFIG_FILE}" ] && export AWS_CONFIG_FILE="${HOME}/.aws/config"

