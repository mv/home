#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
#
# Terraform
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2022-08: Terraform 1.2.6

###
#     https://learn.hashicorp.com/tutorials/terraform/install-cli
#     https://www.terraform.io/cli/config/environment-variables
#
#     $ brew install terraform
#     $ terraform -install-autocomplete
#

_bashrc_verbose "== Terraform"

if   _cmd_exists terraform
then :
else return 0
fi

#xport TF_LOG_PATH=./terraform.log
#xport TF_LOG=off

alias tf='terraform'

alias    tfo='_echodo terraform output'
alias   tfpl='_echodo terraform plan -out=/tmp/tfplan'
alias   tfco='_echodo terraform console'
alias   tfva='_echodo terraform validate'
alias   tfve='_echodo terraform version'

alias   tfap='_echodo terraform apply'
alias tfaptf='_echodo terraform apply /tmp/tfplan'
alias tfapaa='_echodo terraform apply -auto-approve'

alias   tfsh='_echodo terraform show'
alias tfstls='_echodo terraform state list'
alias tfstsh='_echodo terraform state show'

function tfst() {
  terraform state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}

###
### bash-completion
###

complete -C $( dirname `which terraform` )/terraform terraform
complete -C $( dirname `which terraform` )/terraform tf