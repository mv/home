#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
#
# Terraform
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2025-08: kubectl 1.33.4

###
#     https://learn.hashicorp.com/tutorials/terraform/install-cli
#     https://www.terraform.io/cli/config/environment-variables
#
#     $ brew install kubernetes-cli
#

if   _cmd_exists kubectl
then _bashrc_verbose "== K8s/kubectl-cli"
else return
fi


###
### bash-completion
###

_file=~/work/mv-home/bash_completion.d/kubectl

[ ! -f "${_file}" ] && kubectl completion bash > "${_file}"

source "${_file}"
