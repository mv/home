#!/bin/bash
# vim:ft=sh:
#
# Terraform
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2024-12: Terragrunt


if ! which terragrunt &>/dev/null
then return
fi

alias tg='terragrunt'
alias tgve='terragrunt version'

alias tgpl='terragrunt plan'
alias tgco='terragrunt console'
alias tgva='terragrunt validate'
alias tgo='terragrunt output'

alias tgap='terragrunt apply -auto-approve'
alias tgapaa='terragrunt apply -auto-approve'

alias   tgd='terragrunt destroy --terragrunt-no-destroy-dependencies-check'
alias tgdap='terragrunt destroy --terragrunt-no-destroy-dependencies-check --terragrunt-non-interactive -auto-approve'

alias tgsh='terragrunt show'
alias tgstls='terragrunt state list'
alias tgstsh='terragrunt state show'

function tgst() {
  terragrunt state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}
