#!/bin/bash

###
### mvf
### using ec2-ami-tools


# pre-req:
#     brew install ec2-ami-tools
#     mkdir ~/.ec2
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"

# vim: ft=sh:

