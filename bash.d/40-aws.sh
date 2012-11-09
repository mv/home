#!/bin/bash
#
# using ec2 tools
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2011-11


###
### programs
###
case $( uname -s ) in
    Darwin)
        # pre-req:
        #     brew install ec2-ami-tools
        #     brew install ec2-api-tools
        #     mkdir ~/.ec2 && chmod 700 ~/.ec2
        export        JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    ;;
    Linux)
        # pre-req:
        #     yum install openjdk-7.0
        #     yum install ec2-api-tools
        #     yum install ec2-ami-tools
        export        JAVA_HOME="/usr"
      # export         EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.3/jars"
      # export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
    ;;
esac

###
### credentials
###     mkdir ~/.aws && chmod 700 ~/.aws
###

# My vars: when using aws-sdk
export   AWS_CREDENTIAL_FILE="/Users/marcus/.aws/aws-credential-file.cfg"
export     AWS_ACCESS_KEY_ID=$( awk -F= '/AccessKey/ {print $2}' $AWS_CREDENTIAL_FILE )
export AWS_SECRET_ACCESS_KEY=$( awk -F= '/SecretKey/ {print $2}' $AWS_CREDENTIAL_FILE )


# EC2 api-tools/ami-tools
#     http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/setting-up-your-tools.html
#     ec2-version
#     ec2-describe-regions
#     ec2-describe-instances
#     ec2-describe-volumes
export         EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.5.0/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.4.0.7/jars"
export         EC2_CERT="$(/bin/ls $HOME/.aws/cert-*.pem)"
export  EC2_PRIVATE_KEY="$(/bin/ls $HOME/.aws/pk-*.pem)"

# Default region
export EC2_REGION=sa-east-1

# Default Service Point
export EC2_URL=https://ec2.sa-east-1.amazonaws.com

# RDS
#     http://docs.amazonwebservices.com/AmazonRDS/latest/UserGuide/StartCLI.html
#     rds-version
#     rds-describe-db-instances
#     rds-describe-db-parameters default.mysql5.5
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.8.002/jars"
#xport AWS_CREDENTIAL_FILE="/Users/marcus/.aws/edenbrasil-credential-file.cfg"

# ELB
#     http://docs.amazonwebservices.com/ElasticLoadBalancing/latest/DeveloperGuide/UsingTheCommandLineTools.html
#     elb-version
#     elb-describe-lbs
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
#xport AWS_CREDENTIAL_FILE="/Users/marcus/.aws/edenbrasil-credential-file.cfg"

# AS
#     http://docs.amazonwebservices.com/AutoScaling/latest/GettingStartedGuide/SetupCLI.html
#     as-version
#     as-describe-adjustment-types
#     as-describe-process-types
#     as-describe-tags
export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
export AWS_AUTO_SCALING_URL="http://autoscaling.sa-east-1.amazonaws.com"
#xport AWS_CREDENTIAL_FILE="/Users/marcus/.aws/edenbrasil-credential-file.cfg"

# IAM
#     http://docs.amazonwebservices.com/IAM/latest/CLIReference/Setup.html
#     iam-accountaliaslist
#     iam-usergetattributes
#     iam-userlistcerts
#     iam-userlistkeys
export AWS_IAM_HOME="/usr/local/Cellar/aws-iam-tools/1.5.0/jars"
#xport AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

# Cloud-Watch
#     http://docs.amazonwebservices.com/AmazonCloudWatch/latest/GettingStartedGuide/SetupCLI.html
#     mon-version
#     mon-list-metrics
#     mon-describe-alarms
export AWS_CLOUDWATCH_HOME="/usr/local/Cellar/cloud-watch/1.0.12.1/jars"
#xport AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

# ElastiCache
export AWS_ELASTICACHE_HOME="/usr/local/Library/LinkedKegs/aws-elasticache/jars"

# CloudFormation
export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"

# SimpleNotificationService
export AWS_SNS_HOME="/usr/local/Library/LinkedKegs/aws-sns-cli/jars"

# function __ec2_access_id() {
#     cat $HOME/.ec2/ec2-access-id.txt
# }

# function __ec2_secret_key() {
#     cat $HOME/.ec2/ec2-secret-key.txt
# }

###
### shortcuts
###
# alias ec2-list-keypairs=' ec2-describe-keypairs | column -t | sort'
# alias ec2-list-regions='  ec2-describe-regions  | sort'
# alias ec2-list-tags='     ec2-describe-tags     | sort'

# alias ec2-list-available-zones='   ec2-describe-availability-zones | sort'
# alias ec2-list-available-zones-sa='ec2-describe-availability-zones --region sa-east-1 | sort'

# alias ec2-list-instances='ec2-describe-instances --region sa-east-1 | column -t | cat -n'
# alias ec2-list-volumes='  ec2-describe-volumes   --region sa-east-1 | column -t | sort'
# alias ec2-list-groups='   ec2-describe-group     --region sa-east-1'

# alias ec2-list-console='  ec2-get-console-output --region sa-east-1'

# alias ssh-am="ssh `cat ~/.ec2/current.txt`"
# function cat-am() {
#     [ ! -z "$1" ] && cat $1 > ~/.ec2/current.txt
# }

# vim:ft=sh:

