#!/bin/bash
#
# using ec2 tools
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2011-11
# 2013-10: awscli


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
#     ;;
# esac

###
### credentials
###     mkdir ~/.aws && chmod 700 ~/.aws
###

###
### Main vars, for all aws tools....
###

export   AWS_CREDENTIAL_FILE="$HOME/.aws/aws-credential-file.cfg"
export     AWS_ACCESS_KEY_ID=$( awk -F= '/AccessKey/ {print $2}' $AWS_CREDENTIAL_FILE 2>/dev/null || echo "Null" )
export AWS_SECRET_ACCESS_KEY=$( awk -F= '/SecretKey/ {print $2}' $AWS_CREDENTIAL_FILE 2>/dev/null || echo "Null" )


###
### AWS cli, python version
###
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
export AWS_DEFAULT_OUTPUT=text
complete -C aws_completer aws    # bash-completion



###
### AWS command line, java version
###
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

# EC2 only
export         EC2_CERT=$(/bin/ls $HOME/.aws/cert-*.pem 2>/dev/null || echo "Null" )
export  EC2_PRIVATE_KEY=$(/bin/ls $HOME/.aws/pk-*.pem   2>/dev/null || echo "Null" )

# Default region
export EC2_REGION=sa-east-1
# Default Service Point
export EC2_URL=https://ec2.sa-east-1.amazonaws.com

# RDS
# ---
#     $ brew install rds-command-line-tools
#     http://docs.amazonwebservices.com/AmazonRDS/latest/UserGuide/StartCLI.html
#     rds-version
#     rds-describe-db-instances
#     rds-describe-db-parameters default.mysql5.5
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.14.001/libexec"

# ELB
# ---
#     $ brew install elb-tools
#     http://docs.amazonwebservices.com/ElasticLoadBalancing/latest/DeveloperGuide/UsingTheCommandLineTools.html
#     elb-version
#     elb-describe-lbs
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.23.0/libexec"

# AS
# --
#     $ brew install auto-scaling
#     http://docs.amazonwebservices.com/AutoScaling/latest/GettingStartedGuide/SetupCLI.html
#     as-version
#     as-describe-adjustment-types
#     as-describe-process-types
#     as-describe-tags
export AWS_AUTO_SCALING_HOME="/usr/local/Cellar/auto-scaling/1.0.61.4/libexec"
export AWS_AUTO_SCALING_URL="http://autoscaling.sa-east-1.amazonaws.com"

# IAM
# ---
#     $ brew install aws-iam-tools
#     http://docs.amazonwebservices.com/IAM/latest/CLIReference/Setup.html
#     iam-accountaliaslist
#     iam-usergetattributes
#     iam-userlistcerts
#     iam-userlistkeys
export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/libexec"

# CloudWatch
# -----------
#     $ brew install cloud-watch
#     http://docs.amazonwebservices.com/AmazonCloudWatch/latest/GettingStartedGuide/SetupCLI.html
#     mon-version
#     mon-list-metrics
#     mon-describe-alarms
export AWS_CLOUDWATCH_HOME="/usr/local/Cellar/cloud-watch/1.0.13.4/libexec"
export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
export AWS_CLOUDWATCH_URL="https://monitoring.sa-east-1.amazonaws.com"

# ElastiCache
# -----------
#     $ brew install aws-elasticache
#
export AWS_ELASTICACHE_HOME="/usr/local/Cellar/aws-elasticache/1.9.000/libexec"

# Elastic Beanstalk
# -----------------
#     $ brew install aws-elasticbeanstalk
#
export AWS_ELASTICBEANSTALK_HOME="/usr/local/Cellar/aws-elasticbeanstalk/2.6.0"
export AWS_ELASTICBEANSTALK_URL="https://elasticbeanstalk.sa-east-1.amazonaws.com"

# CloudFormation
# --------------
#     $ brew install aws-cfn-tools
#
export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.12/libexec"

# SNS
# ---
#     $ brew install aws-sns-cli
#
export AWS_SNS_HOME="/usr/local/Cellar/aws-sns-cli/2013-09-27/libexec"


###
### Independent tools
###
#
# S3
# --
#     $ brew install s3cmd
#     http://s3tools.org/s3cmd
#     s3cmd --help
#     s3cmd ls
# or
#     $ curl https://raw.github.com/timkay/aws/master/aws -o /usr/local/bin/aws.pl && chmod +x /usr/local/bin/aws.pl
#     http://timkay.com/aws/
#     aws.pl

#xport  S3_URL=https://s3.sa-east-1.amazonaws.com


# vim:ft=sh:

