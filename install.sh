#!/bin/bash
#
# mv/home (git repos) install
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#


lnfile() {
    [ -f $2 ] && /bin/rm $2
    ln $1 $2
}

lndir() {
    [ -e $2 ] && /bin/rm $2
    ln -s $1 $2
}

lnfile dot.bashrc.sh    .bashrc
lnfile dot.profile.sh   .profile
lnfile dot.vimrc        .vimrc

lndir  dot.vim          .vim
lndir  bin.macOS        bin

