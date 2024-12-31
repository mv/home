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
alias tgdaa='terragrunt destroy --terragrunt-no-destroy-dependencies-check --terragrunt-non-interactive -auto-approve'

alias tgsh='terragrunt show'
alias tgstls='terragrunt state list'
alias tgstsh='terragrunt state show'

function tgst() {
  terragrunt state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}

export TERRAGRUNT_NO_AUTO_INIT=1
export TERRAGRUNT_LOG_CUSTOM_FORMAT="\
%time(color=light-cyan,format=Y-m-d H:i:s,suffix='|')\
%level(color=preset,case=upper,width=6,suffix='|')\
%prefix(color=gradient,path=relative,suffix='/| ')\
%tf-path(color=cyan,suffix=': ')\
%msg(path=relative)"
