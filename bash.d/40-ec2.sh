#!/bin/bash

###
### mvf
### using ec2-ami-tools


# pre-req:
#     brew install ec2-ami-tools
#     brew install ec2-api-tools
#     mkdir ~/.ec2 && chmod 700 ~/.ec2

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.0.1/jars"

alias ec2-list-keypairs=' ec2-describe-keypairs | column -t | sort'
alias ec2-list-regions='  ec2-describe-regions  | sort'
alias ec2-list-tags='     ec2-describe-tags     | sort'

alias ec2-list-available-zones='   ec2-describe-availability-zones | sort'
alias ec2-list-available-zones-sa='ec2-describe-availability-zones --region sa-east-1 | sort'

alias ec2-list-instances='ec2-describe-instances --region sa-east-1 | column -t | cat -n'
alias ec2-list-volumes='  ec2-describe-volumes   --region sa-east-1 | column -t | sort'
alias ec2-list-groups='   ec2-describe-group     --region sa-east-1'

alias ec2-list-console='  ec2-get-console-output --region sa-east-1'

# vim:ft=sh:

