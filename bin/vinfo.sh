#!/bin/bash
#
# vinfo
#     version info: imitates svn info for git,hg
#
# Marcus Vinicius Ferreira                      ferreira.mv[ at ]gmail.com
# 2009/09
#


# svn
if [ -d .svn ]
then
    printf "\nSvn Info\n--------\n"
    svn info
fi

# svk
# info="$(svk info 2>/dev/null)"
# if [ "$info" ]
# then
#     printf "\nSVK Info\n--------\n"
#     svk info
# fi

# Git
git_dir="$(git rev-parse --git-dir 2>/dev/null)"
if [ -f $git_dir/config ]
then
    printf "\nGit Info\n--------\n"
    grep url $git_dir/config

    printf "\nBranch: $(git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///')\n\n"
fi

# Hg
if [ -d .hg ]
then
    printf "\nHg Info\n--------\n"
    grep default .hg/hgrc

    printf "\nBranch: $(cat .hg/branch)\n\n"
fi


