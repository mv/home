#!/bin/bash

###
### mvf
### using ec2-ami-tools


# pre-req:
#     brew install ec2-ami-tools
#     mkdir ~/.ec2 && chmod 700 ~/.ec2

# export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
# export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
# export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
# export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"

export EC2_HOME=~/.ec2
export AWS_RDS_HOME=~/.ec2/RDSCli-1.4.006

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`

pathadd $EC2_HOME/bin
pathadd $AWS_RDS_HOME/bin

# vim: ft=sh:

