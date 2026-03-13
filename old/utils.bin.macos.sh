#!/usr/bin/env bash
#
# ~/bin utils
#
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#
#


ln_if() {
    [ -f "$2" ] && ln -s $2 $1
}

DIR=~/bin
APP=/Users/mferreira/App

ln_if ${DIR}/mview ${APP}/mvim
ln_if ${DIR}/mvim  ${APP}/mvim
ln_if ${DIR}/tw    /usr/bin/edit


