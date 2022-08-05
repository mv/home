#!/bin/bash
# vim:ft=sh:
#
# using aws elastic beanstalk
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2022-08: refactor env VARS.

# awsebcli: Elasticbeanstalk CLI
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-configuration.html
  [ "${AWS_PROFILE}" ] && export AWS_EB_PROFILE="${AWS_PROFILE}"
