#!/bin/bash

###
### mvf
### bashrc lib

DIR=/u01/perl
APP=${DIR}/bin/perl

# set -x
if [ -x "${APP}" ]
then
    alias perl="${APP}"
    pathadd "${DIR}/bin"
    manpathadd "${DIR}/share/man"
    manpathadd "${DIR}/site_perl/man"

    export PATH MANPATH

#   printf "\nUsing perl [ $MYPERL ]\n\n"

fi
# set +x

export PERL5LIB=/work/perl/lib

# vim: ft=sh:

