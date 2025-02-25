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

if ! which terraform &>/dev/null
then return
fi

#xport TF_LOG_PATH=./terraform.log
#xport TF_LOG=off

alias tf='terraform'

alias    tfo='echodo_ terraform output'
alias   tfpl='echodo_ terraform plan -out=/tmp/tfplan'
alias   tfco='echodo_ terraform console'
alias   tfva='echodo_ terraform validate'
alias   tfve='echodo_ terraform version'

alias   tfap='echodo_ terraform apply'
alias tfaptf='echodo_ terraform apply /tmp/tfplan'
alias tfapaa='echodo_ terraform apply -auto-approve'

alias   tfsh='echodo_ terraform show'
alias tfstls='echodo_ terraform state list'
alias tfstsh='echodo_ terraform state show'

function tfst() {
  terraform state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}

function echodo_() {
  echo
  echo "$ ${@}"
  echo
  ${@}
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
