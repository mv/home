#!/bin/bash
### mvf
### git-achievements

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

myclone="git@github.com:mv/git-achievements.git"

dir=/work/mv/dev
#pathadd ${dir}/git-achievements

alias git="${dir}/git-achievements/git-achievements"

# vim: ft=sh:

