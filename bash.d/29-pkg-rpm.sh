#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### Package commands

if _cmd_exists rpm
then _bashrc_verbose "== Package/RPM"
else return
fi

function rpmqf() {
    if [ "${1}" == "" ]
    then
        echo "RPM: find a file in a package"
        return
    fi

    _cmd=$( which "${1}" | grep -v alias )
    if [ "${_cmd}" != "" ]
    then echo "=== RPM: $(rpm -qf ${_cmd})"
    else echo "=== DNF: $(dnf provides ${1})"
    fi
}

function rpmql() {
    if [ "${1}" == "" ]
    then
        echo "RPM: list packages"
        return
    fi

    if [ "${2}" == "" ]
    then rpm -ql ${1}
    else rpm -ql ${1} | grep ${2}
    fi
}

function dnfl() {
    if [ "${1}" == "" ]
    then
        echo "DNF: list packages"
        return
    fi

    dnf list | grep -i "${1}" | sort
}
