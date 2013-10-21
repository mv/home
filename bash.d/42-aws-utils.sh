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


# vim:ft=sh:

