#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### Package commands

if _cmd_exists apk
then _bashrc_verbose "== Package/Alpine"
else return
fi

function apkil() {
    if [ "${1}" == "" ]
    then return
    fi

    if [ "${2}" == "" ]
    then apk info -L ${1}
    else apk info -L ${1} | grep ${2}
    fi
}

function apksv() {
    apk search -v "cmd:${1}"
}
