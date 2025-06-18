#!/bin/bash
# vim:ft=sh:
#
# aws-profile [<profile-name>]
#   View/change AWS_PROFILE
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2023-12
#

_bashrc_verbose "== AWS/Profile"

function aws-config-file() {
  # default
  if [ "${AWS_CONFIG_FILE}" == "" ]
  then AWS_CONFIG_FILE=~/.aws/config
  fi
  if [ "${1}" == "" ]
  then
    echo
    echo "== AWS_CONFIG_FILE='${AWS_CONFIG_FILE}'";
    echo
    echo "To change AWS_CONFIG_FILE"
    echo "   aws-config-file <file>"
    echo
    echo "Current: [${AWS_CONFIG_FILE}]"
    echo
    return 0
  fi
  if [ "${1}" != "" ] && [ -f ${1} ]
  then
    # tilde expansion
    export AWS_CONFIG_FILE=${1}
    echo
    echo "== AWS_CONFIG_FILE='${AWS_CONFIG_FILE}'";
    echo
  else
    echo
    echo "== NOT FOUND: [${1}]"
    echo
  fi
}
echo "== Sourcing: defined: [aws-config-file]"


function aws-profile() {
  # config
  if [ "${AWS_CONFIG_FILE}" == "" ]
  then AWS_CONFIG_FILE=~/.aws/config
  fi

  # list
  if [ "${1}" == "-l" ]
  then
    grep --color "^\[profile" ${AWS_CONFIG_FILE} | sort;
    return 0;
  fi
  # details
  if [ "${1}" == "-s" ]
  then
    awk "/^\[profile ${AWS_PROFILE}\]/ , /^$/" ${AWS_CONFIG_FILE};
    return 0
  fi
  # set
  if [ "${1}" != "" ]
  then
    export AWS_PROFILE="${1}";
    echo
    echo "== AWS_PROFILE='${AWS_PROFILE}'";
    echo
    return 0
  fi
  # usage
  echo
  echo "== AWS_PROFILE='${AWS_PROFILE}'";
  echo
  echo "To change AWS_profile"
  echo "   aws-profile -l        # list available profiles in AWS_CONFIG_FILE"
  echo "   aws-profile -s        # show definition of profile"
  echo "   aws-profile <target>  # set new profile"
  echo
  echo "Current: [${AWS_PROFILE}]";
  echo
}
echo "== Sourcing: defined: [aws-profile]"

###
echo
