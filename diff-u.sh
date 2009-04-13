#!/bin/bash
#
# mv/home (git repos) install
# Marcus Vinicius Ferreira  ferreira.mv[ at ]gmail.com
#
#


DIR=~/Work/mv_home

diff -u ${DIR}/dot.bashrc.sh    ~/.bashrc
diff -u ${DIR}/dot.profile.sh   ~/.profile
diff -u ${DIR}/dot.gitconfig    ~/.gitconfig
diff -u ${DIR}/dot.gitignore    ~/.gitignore



