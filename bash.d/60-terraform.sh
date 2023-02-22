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

export TF_LOG_PATH=./terraform.log
export TF_LOG=off

alias tf='terraform'
alias tfve='terraform version'


alias tfpl='terraform plan'
alias tfco='terraform console'
alias tfva='terraform validate'

alias tfap='terraform apply -auto-approve'
alias tfapaa='terraform apply -auto-approve'

alias tfsh='terraform show'
alias tfstls='terraform state list'
alias tfstsh='terraform state show'

function tfst() {
  terraform state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}

###
### bash-completion
###

if which         /usr/local/bin/terraform 2>/dev/null 1>/dev/null
then complete -C /usr/local/bin/terraform terraform
fi

if which         /opt/homebrew/bin/terraform 2>/dev/null 1>/dev/null
then complete -C /opt/homebrew/bin/terraform terraform
fi

