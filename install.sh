#!/bin/bash
#
# mv/home (git repos) install
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#
#    git clone git://github.com/mv/home mv_home
#


lnfile() {
    [ -f $2 ] && /bin/rm $2
    ln $1 $2
}

lndir() {
    [ -e $2 ] && /bin/rm $2
    ln -s $1 $2
}

DIR=~/Work/mv_home

lnfile ${DIR}/dot.bashrc.sh    ~/.bashrc
lnfile ${DIR}/dot.profile.sh   ~/.profile
lnfile ${DIR}/dot.vimrc        ~/.vimrc
lnfile ${DIR}/dot.gitconfig    ~/.gitconfig
lnfile ${DIR}/dot.gitignore    ~/.gitignore

lndir  ${DIR}/dot.vim          ~/.vim
lndir  ${DIR}/bin              ~/bin


