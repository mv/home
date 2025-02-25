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

alias    tgi='echodo_ terragrunt init'
alias    tgo='echodo_ terragrunt output'
alias   tgco='echodo_ terragrunt console'
alias   tgva='echodo_ terragrunt validate'
alias   tgve='echodo_ terragrunt version'

alias   tgpl='echodo_ terragrunt plan -out=/tmp/tfplan'
alias  tgpld='echodo_ terragrunt plan -destroy -out=/tmp/tfplan'

alias   tgap='echodo_ terragrunt apply'
alias tgaptf='echodo_ terragrunt apply /tmp/tfplan'
alias tgapaa='echodo_ terragrunt apply -auto-approve'

alias    tgd='echodo_ terragrunt destroy --terragrunt-no-destroy-dependencies-check'
alias  tgdaa='echodo_ terragrunt destroy --terragrunt-no-destroy-dependencies-check --terragrunt-non-interactive -auto-approve'
alias  tgdap='echodo_ terragrunt destroy --terragrunt-no-destroy-dependencies-check --terragrunt-non-interactive -auto-approve'

alias   tgsh='echodo_ terragrunt show'
alias tgstls='echodo_ terragrunt state list'
alias tgstsh='echodo_ terragrunt state show'

function tgst() {
  terragrunt state list | awk -F'.' '{print $1"."$2}' | sort | uniq
}

function echodo_() {
  echo
  echo "$ ${@}"
  echo
  ${@}
}

export TERRAGRUNT_NO_AUTO_INIT=1
export TERRAGRUNT_LOG_CUSTOM_FORMAT="\
%time(color=light-cyan,format=Y-m-d H:i:s,suffix='|')\
%level(color=preset,case=upper,width=6,suffix='|')\
%prefix(color=gradient,path=relative,suffix='/| ')\
%tf-path(color=cyan,suffix=': ')\
%msg(path=relative)"
