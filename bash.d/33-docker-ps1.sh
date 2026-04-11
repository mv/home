#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
# vim:ft=sh:
#
# Docker
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2025-06: Docker run stuff
#


if  [ -f /.dockerenv ]
then _bashrc_verbose "== Docker/PS1"
else return
fi


function __docker_ps1() {
  if [ -f /etc/os-release ]
  then _distro=$(
       awk -F= '/^ID=/ {print $2}' /etc/os-release | tr -d '"'
  )
  else _distro=$( uname -s )
  fi

  echo "docker:${_distro}:$(hostname)"
}