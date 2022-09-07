#!/bin/bash
#
# mv/home (git repos) install
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#
#    git clone git://github.com/mv/home mv_home
#

DIR=~/work/mv-home

for f in ${DIR}/dot.*
do
  ln -snf $f ~/.${f#*dot.}
done

cd ~/
ln -snf  ${DIR}/bin
ln -snf  ${DIR}/bash.d
ln -snf  ${DIR}/bash_completion.d
ln -snf  ${DIR}/vagrant.d/Vagrantfile  ~/.vagrant.d/Vagrantfile

[ ! -d ~/var ] && mkdir ~/var

