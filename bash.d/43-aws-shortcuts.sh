#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
#
# Collected shortcuts
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: collection

_bashrc_verbose "== AWS/Shortcuts"

###
### Shortcuts
###
function aws-r53-list() {
    aws route53 list-hosted-zones | grep hosted | awk '{print $4}' | \
    while read z
    do
        echo $z
        aws route53 get-hosted-zone --id $z --output json | egrep '"Name"|ns-'
    done
}

function aws-current-account() {
    aws sts get-caller-identity --query "Account" --output text
}

function aws-get-caller-identity() {
    aws sts get-caller-identity --query "Account" --output text
}
