#!/bin/bash
# vim:ft=sh:
#
# Docker
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2025-06: Docker run stuff
#

if   which docker 2>/dev/null 1>/dev/null
then echo "Aliases: Docker"
else return 0
fi

alias dim="docker images"
alias dti="docker run -ti"
alias dtir="docker run -ti --rm"
alias drmi="docker rmi"

# run container shell
function dtsh() {
  docker run -ti --rm ${@} /bin/sh
}
