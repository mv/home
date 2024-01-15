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

###
### bash-completion
###

if which /usr/local/bin/terraform 2>/dev/null 1>/dev/null
then complete -C /usr/local/bin/terraform terraform
fi

###
###
###
alias tfr="terraform refresh"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfs="terraform show"

function tfo() {
  _plan="plan-$( date +'%s').plan"
  echo "terraform plan -out: ${_plan}"
  terraform plan -out ${_plan}
}

function tfg() {
  _graph="graph-$( date +'%s')"
  echo "terraform graph : ${_graph}"
  terraform graph | dot -Tsvg -o ${_graph}.svg \
  && open ${_graph}.svg
}
