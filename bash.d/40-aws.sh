#!/bin/bash
#
# using ec2 tools
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2011-11


###
### programs
###
# case $( uname -s ) in
#     Darwin)
#         # pre-req:
#         #     brew install ec2-ami-tools
#         #     brew install ec2-api-tools
#         #     mkdir ~/.ec2 && chmod 700 ~/.ec2
          export        JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
#     ;;
#     Linux)
#         # pre-req:
#         #     yum install openjdk-7.0
#         #     yum install ec2-api-tools
#         #     yum install ec2-ami-tools
#         export        JAVA_HOME="/usr"
#       # export         EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.3/jars"
#       # export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
#     ;;
# esac

###
### credentials
###     mkdir ~/.aws && chmod 700 ~/.aws
###

# My vars
export   AWS_CREDENTIAL_FILE="$HOME/.aws/aws-credential-file.cfg"
export     AWS_ACCESS_KEY_ID=$( awk -F= '/AccessKey/ {print $2}' $AWS_CREDENTIAL_FILE )
export AWS_SECRET_ACCESS_KEY=$( awk -F= '/SecretKey/ {print $2}' $AWS_CREDENTIAL_FILE )


# AWS cli, python version
#     http://aws.amazon.com/cli/
#     http://docs.aws.amazon.com/cli/latest/reference/
#
#     $ easy_install awscli
#     or
#     $ easy_install pip
#     $ pip install awscli
#
#     aws help
#
export AWS_DEFAULT_REGION=sa-east-1
export AWS_DEFAULT_OUTPUT=table
complete -C aws_completer aws    # bash



# EC2
#     $ brew install ec2-ami-tools
#     $ brew install ec2-api-tools
#     http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/setting-up-your-tools.html
#     ec2-version
#     ec2-describe-regions
#     ec2-describe-instances
#     ec2-describe-volumes
export         EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.5.0/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.4.0.7/jars"

# EC2 cli, java version
export         EC2_CERT="$(/bin/ls $HOME/.aws/cert-*.pem)"
export  EC2_PRIVATE_KEY="$(/bin/ls $HOME/.aws/pk-*.pem)"

# Default region
export EC2_REGION=sa-east-1
# Default Service Point
export EC2_URL=https://ec2.sa-east-1.amazonaws.com


#xport  S3_URL=https://s3.sa-east-1.amazonaws.com

# RDS
#     $ brew install rds-command-line-tools
#     http://docs.amazonwebservices.com/AmazonRDS/latest/UserGuide/StartCLI.html
#     rds-version
#     rds-describe-db-instances
#     rds-describe-db-parameters default.mysql5.5
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.8.002/jars"
#xport AWS_CREDENTIAL_FILE="$HOME/.aws/edenbrasil-credential-file.cfg"

# ELB
#     $ brew install elb-tools
#     http://docs.amazonwebservices.com/ElasticLoadBalancing/latest/DeveloperGuide/UsingTheCommandLineTools.html
#     elb-version
#     elb-describe-lbs
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
#xport AWS_CREDENTIAL_FILE="$HOME/.aws/edenbrasil-credential-file.cfg"

# AS
#     $ brew install auto-scaling
#     http://docs.amazonwebservices.com/AutoScaling/latest/GettingStartedGuide/SetupCLI.html
#     as-version
#     as-describe-adjustment-types
#     as-describe-process-types
#     as-describe-tags
export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
export AWS_AUTO_SCALING_URL="http://autoscaling.sa-east-1.amazonaws.com"
#xport AWS_CREDENTIAL_FILE="$HOME/.aws/edenbrasil-credential-file.cfg"

# IAM
#     $ brew install aws-iam-tools
#     http://docs.amazonwebservices.com/IAM/latest/CLIReference/Setup.html
#     iam-accountaliaslist
#     iam-usergetattributes
#     iam-userlistcerts
#     iam-userlistkeys
export AWS_IAM_HOME="/usr/local/Cellar/aws-iam-tools/1.5.0/jars"
#xport AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

# Cloud-Watch
#     $ brew install cloud-watch
#     http://docs.amazonwebservices.com/AmazonCloudWatch/latest/GettingStartedGuide/SetupCLI.html
#     mon-version
#     mon-list-metrics
#     mon-describe-alarms
export AWS_CLOUDWATCH_HOME="/usr/local/Cellar/cloud-watch/1.0.12.1/jars"
export AWS_CLOUDWATCH_URL="https://monitoring.sa-east-1.amazonaws.com"
#xport AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

# ElastiCache
#     $ brew install aws-elasticache
#
export AWS_ELASTICACHE_HOME="/usr/local/Library/LinkedKegs/aws-elasticache/jars"

# CloudFormation
#     $ brew install aws-cfn-tools
#
export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"

# SimpleNotificationService
#     $ brew install aws-sns-cli
#
export AWS_SNS_HOME="/usr/local/Library/LinkedKegs/aws-sns-cli/jars"


# vim:ft=sh:

