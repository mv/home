#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
# vim:ft=sh:
#
# Terraform
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-09: Terragrunt 0.50.14

_bashrc_verbose "== Terragrunt"

if   _cmd_exists terragrunt
then :
else return 0
fi


###
#     https://https://terragrunt.gruntwork.io/
#     https://terragrunt.gruntwork.io/docs/getting-started/install/#install-terragrunt
#
#     $ brew install terragrunt
#

alias tg='terragrunt'
alias tgve='tg -version'


alias tgpl='tg plan'
alias tgva='tg validate'

alias tgap='tg apply -auto-approve'
alias tgapaa='tg apply -auto-approve'

