#!/bin/bash
#
# Changing between amazon accounts
#
# This script must be sourced by your ~/.bashrc or something
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-11
# 2015-03

eval  AWSENV_PROFILES_DIR="~/work/mv/mv-priv/awsenv/profiles"
eval AWSENV_TEMPLATES_DIR="~/work/mv/mv-priv/awsenv/templates" # optional

export AWSENV_PROFILES_DIR AWSENV_TEMPLATES_DIR

source ~/work/mv/dev/mv-awsenv/awsenv.sh

awsenv-set "mvtest"

# vim:ft=sh:

