#!/bin/bash

###
### mvf
### bashrc lib

DIR=/u01/app/mysql
APP=${DIR}/current/bin/mysql

# set -x
if [ -x "${APP}" ]
then
    # alias perl="${MYPERL}"
    pathadd    "${DIR}/bin"
    pathadd    "${DIR}/current/bin"
    manpathadd "${DIR}/current/share/man"
    export PATH MANPATH

    alias mysql.base="cd ${DIR}         && ls -l"
    alias mysql.home="cd ${DIR}/current && ls -l"
    alias mysql.log=" cd ${DIR}/log     && ls -l *log"
    alias mysql.data="cd ${DIR}/data    && ls -l"

fi

function __mysql_ps1() {
    if which mysql 2>/dev/null 1>/dev/null
    then
        echo "[mysql:$( mysql --version | awk '{print $5}' | awk -F, '{print $1}' )]"
    fi
}

# vim: ft=sh:

