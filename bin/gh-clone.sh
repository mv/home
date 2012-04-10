#!/bin/bash
#
# Clone from github and rename dir
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-03
#

[ -z "$1" ] && {

    echo
    echo "Usage: $0 github-owner/repos"
    echo
    exit 1

}

owner=$( echo $1 | awk -F/ '{print $1}')
repos=$( echo $1 | awk -F/ '{print $2}')

git clone https://github.com/${owner}/${repos}  git-${owner}-${repos}


