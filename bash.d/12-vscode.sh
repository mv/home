#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== VSCode"

# MacOS X {

if [ `uname -s` == "Darwin" ]
then
  _bashrc_verbose "-- VSCode/Vim/MacOS"

  # Ref:
  #   https://github.com/VSCodeVim/Vim?tab=readme-ov-file#mac
  #
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled            -bool false   # For VS Code
# defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled    -bool false   # For VS Code Insider
# defaults write com.vscodium ApplePressAndHoldEnabled                    -bool false   # For VS Codium
# defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
# defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
fi
