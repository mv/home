#!/bin/bash
#
# sqlp.sh
#     wrapper to my proxy user
#
# Marcus Vinicius Ferreira              ferreira.mv[ at ]gmail.com
# 2009/Jun
#

[ -z "$1" ] && {
    cat <<CAT

    Usage: $0 user@db 

CAT
exit 2
}

_username=${1%@*} # before '@'
 _connect=${1#*@} # after  '@'

[ "$_connect" == "$_username" ] && _connect="$2"

sqlplus -L mvdba[${_username}]@${_connect}


