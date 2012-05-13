#!/bin/bash
#
#

[ -z "$1" ] && {

    echo
    echo "Usage: . aws-credentials.sh current | list | <aws-profile>"
    echo
    echo "    current:       show current profile"
    echo "    list:          list profiles"
    echo "    <aws-profile>: set profile <aws-profile>"
    echo
#   exit 2
}

DIR=/work/mv-priv/amazon
tmp=/tmp/var.$$.sh
cur=~/.awsenv

[ -d $cur ] || mkdir $cur

current_profile() {
    echo
    echo "Current: $( cat $cur/current )"
    for v in $( env | sort | egrep 'EC2_CERT|EC2_PRIVATE_KEY|AWS_.*KEY' )
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
            export AWS_CREDENTIAL_FILE=$( echo ${DIR}/$prf/aws-credentials-master )

            export     AWS_ACCESS_KEY_ID=$( awk -F": " '/Access Key Id/     {print $2}' $AWS_CREDENTIAL_FILE )
            export AWS_SECRET_ACCESS_KEY=$( awk -F": " '/Secret Access Key/ {print $2}' $AWS_CREDENTIAL_FILE )

            echo $prf > $cur/$prf
            ln -nsf $cur/$prf $cur/current

            echo "[$prf] set."
            current_profile
            return
        fi
    done

    # Profile not found
    current_profile
    echo
    echo "To set a profile: . aws-credentials.sh <aws-profile>"
    echo
#   return
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

