#!/bin/bash

###
### mvf
### bashrc lib

PERLDIR=/u01/perl
 MYPERL=${PERLDIR}/bin/perl

# set -x
if [ -x "${MYPERL}" ]
then
    alias perl="${MYPERL}"
    pathadd "${PERLDIR}/bin"
    manpathadd "${PERLDIR}/share/man"
    manpathadd "${PERLDIR}/site_perl/man"

    export PATH MANPATH

#   printf "\nUsing perl [ $MYPERL ]\n\n"

fi
# set +x

export PERL5LIB=/work/perl/lib

# vim: ft=sh:

