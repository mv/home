#!/bin/bash
# vim:ft=sh:
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

# off, error, warn, info, debug, trace
#xport TF_LOG=info
#xport TF_LOG_CORE=info
#xport TF_LOG_AWS=info
#xport TF_LOG_PATH=./terraform.log

alias tf='terraform'
alias tfve='tf version'


alias tfpl='tf plan'
alias tfco='tf console'
alias tfva='tf validate'

alias tfap='tf apply -auto-approve'
alias tfapaa='tf apply -auto-approve'

alias tfsh='tf show'
alias tfstls='tf state list'
alias tfstsh='tf state show'

function tfst() {
  terraform state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}

###
### bash-completion
###

if which terraform 2>/dev/null 1>/dev/null
then 
  complete -C $( dirname `which terraform` )/terraform terraform
  complete -C $( dirname `which terraform` )/terraform tf
fi

