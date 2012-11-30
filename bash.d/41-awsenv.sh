#!/bin/bash
#
# Changing between amazon accounts
# This script must be sourced by your ~/.bashrc
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-11


###
### My different profiles
###
profiles_dir="/work/mv-priv/awsenv/profiles"
template_dir="/work/mv-priv/awsenv/templates"

###
### A mininum setup
###
[ ! -e ~/.aws ] && {
    mkdir ~/.aws && chmod 700 ~/.aws
}


###
### to be used by PS1
###
function __awsenv_ps1() {
    if [ "$AWSENV_ALIAS" != "" ]
    then
        echo "[aws:$AWSENV_ALIAS]"
    fi
}


###
### credentials
###

# From my credential-file, all other vars are evaluated when read
export   AWS_CREDENTIAL_FILE="$HOME/.aws/aws-credential-file.cfg"
export     AWS_ACCESS_KEY_ID=$( awk -F= '/AccessKey/ {print $2}' $AWS_CREDENTIAL_FILE 2>/dev/null || echo 'NOT-FOUND' )
export AWS_SECRET_ACCESS_KEY=$( awk -F= '/SecretKey/ {print $2}' $AWS_CREDENTIAL_FILE 2>/dev/null || echo 'NOT-FOUND' )


# EC2
export         EC2_CERT="$(/bin/ls $HOME/.aws/cert-*.pem 2>/dev/null || echo 'NOT-FOUND' )"
export  EC2_PRIVATE_KEY="$(/bin/ls $HOME/.aws/pk-*.pem   2>/dev/null || echo 'NOT-FOUND' )"


function awsenv-ls() {

    echo
    echo "AWSEnv: Profiles"
    echo "----------------"
    builtin cd "${profiles_dir}" && find * -type d -prune
    echo

}

function awsenv-set() {

    profile="$1"
    if [ -d "${profiles_dir}/${profile}" ]
    then
        ln -nsf "${profiles_dir}/${profile}" ~/.aws && \
        export AWSENV_ALIAS="${profile}"
    else
        echo
        echo "Profile: DOES NOT exist: [${profile}]"
        echo
    fi

}

function awsenv-generate() {

    profile="$1"

    if [ -z "${profile}" ]
    then
        echo
        echo "Usage: awsenv-generate profile"
        echo
        return
    fi

    if [ ! -d "${profiles_dir}/${profile}" ]
    then
        echo
        echo "Profile: DOES NOT exist: [${profile}]"
        echo
        return
    fi

    credentials="${profiles_dir}/${profile}/aws-credential-file.cfg"
    if [ ! -f "${credentials}" ]
    then
        echo
        echo "Credentials file: DOES NOT exist: [${credentials}]"
        echo "You must create it!"
        echo
        echo "File contents:"
        echo "  AWSAccessKeyId=<<your-key-here!!>>"
        echo "  AWSSecretKey=<<your-secret-here!!>>"
        echo
        return
    fi

    aws_access_key=$( awk -F= '/AccessKey/ {print $2}' $credentials )
    aws_secret_key=$( awk -F= '/SecretKey/ {print $2}' $credentials )

    # do it.
    echo
    echo "Using credentials: [$credentials]"
    echo "Using  Access_Key: [$aws_access_key]"
    echo

    builtin cd "${template_dir}"
    for f in `find . -type f `
    do
        file=${f#./*}
        echo "Generating: $file"
        sed -e "s|__my_access_key__|${aws_access_key}|"     \
            -e "s|__my_secret_key__|${aws_secret_key}|" \
        $file > "${profiles_dir}/${profile}/generated-${file}"
       #$file | head

        ln -nsf "~/.aws/generated-${file}" ~/${file}

    done
    echo

}

# vim:ft=sh:

