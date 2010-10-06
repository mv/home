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

lnfile  ${DIR}/dot.bashrc.sh      ~/.bashrc
lnfile  ${DIR}/dot.profile.sh     ~/.profile
lnfile  ${DIR}/dot.gitattributes  ~/.gitattributes
lnfile  ${DIR}/dot.gitconfig      ~/.gitconfig
lnfile  ${DIR}/dot.gitignore      ~/.gitignore
lnfile  ${DIR}/dot.gitk           ~/.gitk
lnfile  ${DIR}/dot.caprc          ~/.caprc
lnfile  ${DIR}/dot.hgrc           ~/.hgrc
lnfile  ${DIR}/dot.csshrc         ~/.csshrc
lnfile  ${DIR}/dot.my.cnf         ~/.my.cnf
lnfile  ${DIR}/dot.mytop          ~/.mytop
lnfile  ${DIR}/dot.screenrc       ~/.screenrc
lnfile  ${DIR}/dot.inputrc        ~/.inputrc
lnfile  ${DIR}/dot.irbrc          ~/.irbrc

lndir  ${DIR}/bin              ~/bin

[ ! -d ~/var ] && mkdir ~/var

