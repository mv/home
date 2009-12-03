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

#   printf "\nUsing perl [ $MYPERL ]\n\n"
fi
# set +x

# export PERL5LIB=/work/perl/lib

# vim: ft=sh:

