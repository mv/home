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

if   which docker 2>/dev/null 1>/dev/null
then echo "== bash.d: Docker"
else return 0
fi

alias drm="   docker rm"
alias dstart="docker start"
alias dstop=" docker stop"

function dclean() {
  if [ "${1}" == "" ]
  then
    echo
    echo "== Usage: dclean -y|name"
    echo
    return 0
  elif [ "${1}" == "-y" ]
  then
    docker rm $( docker ps -a -q -f status=exited )
  else
    echo "Docker stop: ${1}" ; docker stop "${1}"
    echo "Docker rm  : ${1}" ; docker rm   "${1}"
  fi
}

alias drd="  docker run -d"
alias drti=" docker run -ti"
alias drtir="docker run -ti --rm"

alias deti="docker exec -ti"
alias desh="docker exec -ti --entrypoint=/bin/sh"
alias drsh="docker run -ti --entrypoint=/bin/sh"

_format_ps="--format 'table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Command}}\t{{.Ports}}\t{{.CreatedAt}}\t{{.Status}}'"
alias dps=" docker ps -s    ${_format_ps}"
alias dpsa="docker ps -s -a ${_format_ps}"

_format_img="--format 'table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{truncate .CreatedAt 19}}\t{{.Size}}'"
_format_img="--format 'table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{truncate .CreatedAt 19}}\t{{.Size}}'"
alias dim=" docker images ${_format_img}"
alias dimr="docker rmi"

_format_net="--format 'table {{.ID}}\t{{.Name}}\t{{.Driver}}\t{{.Scope}}\t{{truncate .CreatedAt 19}}'"
alias dnet="docker network ls ${_format_net}"

function dsubnet() {
  (
    echo "NETWORK_ID NAME DRIVER SCOPE CREATED_AT Subnet"
    docker network inspect $(docker network ls \
      | awk '/bridge/ { print $1}') \
      | jq -r '.[] |
      .Id[0:12] + " " +
      .Name + " " +
      .Driver + " " +
      .Scope + " " +
      .Created[0:19] + " " +
      .IPAM.Config[0].Subnet' - \
  ) | column -t
}
