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

alias    tgi='_echodo terragrunt init'
alias    tgo='_echodo terragrunt output'
alias   tgco='_echodo terragrunt console'
alias   tgva='_echodo terragrunt validate'
alias   tgve='_echodo terragrunt version'

alias   tgpl='_echodo terragrunt plan -out=/tmp/tfplan'
alias  tgpld='_echodo terragrunt plan -destroy -out=/tmp/tfplan'

alias   tgap='_echodo terragrunt apply'
alias tgaptf='_echodo terragrunt apply /tmp/tfplan'
alias tgapaa='_echodo terragrunt apply -auto-approve'

alias    tgd='_echodo terragrunt destroy --terragrunt-no-destroy-dependencies-check'
alias  tgdaa='_echodo terragrunt destroy --terragrunt-no-destroy-dependencies-check --terragrunt-non-interactive -auto-approve'
alias  tgdap='_echodo terragrunt destroy --terragrunt-no-destroy-dependencies-check --terragrunt-non-interactive -auto-approve'

alias   tgsh='_echodo terragrunt show'
alias tgstls='_echodo terragrunt state list'
alias tgstsh='_echodo terragrunt state show'

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