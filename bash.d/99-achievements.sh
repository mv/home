#!/bin/bash
### mvf
### git-achievements

dir=/work/dev
myclone="git@github.com:mv/git-achievements.git"

#
# Setup your clone
#
#     git clone $myclone  ${dir}/git-achievements
#     git config --global achievement.upload "true"
#
# You can get your first achievement by running
#
#     git achievements --help
#

alias git="git-achievements"
pathadd ${dir}/git-achievements

# vim: ft=sh:

