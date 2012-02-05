#!/bin/bash
#
#

[ -z "$1" ] && {

    echo
    echo "Usage: ${0##*/} current | list | <aws-profile>"
    echo
    echo "    current:       show current profile"
    echo "    list:          list profiles"
    echo "    <aws-profile>: set profile <aws-profile>"
    echo
    return 2
}

DIR=/work/mv-priv/amazon

current_profile() {
    echo
    echo "Current:"
    for v in $( env | egrep 'EC2_CERT|EC2_PRIVATE_KEY|AWS_CREDENTIAL_FILE' )
    do
        echo "    $v"
    done
    echo
    return
}

list_profiles() {
    echo "AWS profiles:"
    for profile in $( find $DIR/* -type d -prune )
    do
        echo "    - ${profile##*/}"
    done
    echo
    return
}

set_profile() {

    prf="$1"
    for profile in $( find $DIR/* -type d -prune )
    do
        if [ "$prf" == "${profile##*/}" ]
        then
            export EC2_CERT=$( echo ${DIR}/$prf/cert*pem )
            export EC2_PRIVATE_KEY=$( echo ${DIR}/$prf/pk*pem )
            export AWS_CREDENTIAL_FILE=$( echo ${DIR}/$prf/aws_credentials-master )

            echo "[$prf] set."
            current_profile
            return
        fi
    done
    echo
    echo "Profile [$prf] NOT FOUND."
    return
}

case $1 in
    current)
        current_profile
        ;;
    list)
        list_profiles
        ;;
    *)
        set_profile "$1"
        ;;
esac

# vim:ft=sh

