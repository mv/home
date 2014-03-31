#!/bin/bash
#
# Changing between amazon accounts
#
# This script must be sourced by your ~/.bashrc or something
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-11


export AWS_ACCESS_KEY=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_KEY=${AWS_SECRET_ACCESS_KEY}

export ARTIFACTS_AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export ARTIFACTS_AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512M -Xdebug -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n"
export PHANTOMJS_BIN=phantomjs
export KAFKA_HOME=/work/nu/kafka/current
export LOCAL=true

export NU_HOME=/work/nu/repo
export PATH=$NU_HOME/nudev:$PATH

# vim:ft=sh:

