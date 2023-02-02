#!/bin/bash
#
# Changing between amazon accounts
#
# This script must be sourced by your ~/.bashrc or something
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2013-08


###
### by security group
###
function csshg() {
    [ -z "$1" ] && return

    # get running instances
    list=$( aws.pl din --filter "group-name=$1" --filter "instance-state-code=16" --simple | awk '{print $3}' )

    # debug
    if [ "$2" == "-d" ]
    then
        echo "List:"
        echo "$list" | sort
        return
    fi

    # $2: one extra server
    csshX --login ec2-user $list $2

}


###
### by tag 'Name'
###
function cssht() {
    [ -z "$1" ] && return

    # get running instances
    list=$( aws.pl din --filter "tag:Name=${1}*" --filter "instance-state-code=16" --simple | awk '{print $3}' )

    # debug
    if [ "$2" == "-d" ]
    then
        echo "List:"
        echo "$list" | sort
        return
    fi

    # $2: one extra server
    csshX --login ec2-user $list $2

}


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

function aws-iam-list-user-keys() {

    aws.pl lu | grep arn | awk '{print $6}' | sort | \
    while read u
    do
        aws.pl userlistkeys $u --simple | awk '{print $4,$1,$2,$3}'
    done

}

alias aws-dtags='aws.pl dtags --filter resource-type=instance | grep Name | awk "{print \$2,\$8}" | sort -k 2'

function aws-din() {

    aws.pl dtags --filter resource-type=instance | grep Name | awk "{print \$2,\$8}" | sort -k 2 | \
    while read id name
    do
        aws.pl din $id --simple | awk '{print $2,$3}' | while read state sg
        do
            echo "$id  $state  $name"
        done
    done
}


# vim:ft=sh:

