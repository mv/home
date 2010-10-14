#!/bin/bash
#
# mv/home (git repos) install
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#
#    git clone git://github.com/mv/home mv_home
#


lnfile() {
    [ -f $2 ] && /bin/rm $2
    ln -s $1 $2      #   ln $1 $2
}

lndir() {
    [ -e $2 ] && /bin/rm $2
    ln -s $1 $2
}

DIR=~/work/mv-home

for f in ${DIR}/dot.*
do
    lnfile $f ~/.${f#*.}
done

lndir  ${DIR}/bin              ~/bin

[ ! -d ~/var ] && mkdir ~/var

