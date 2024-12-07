#!/bin/bash
# vim:ft=sh:
#
# Win/WSL/Fedora
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com

#alias git='/mnt/c/Program\ Files/Git/mingw64/bin/git.exe'

## set default browser to be open from terminal
_choosy="/mnt/c/Program Files/BrowserPicker/BrowserPicker.exe"
if [ -f "${_choosy}" ]
then export BROWSER="${_choosy}"
fi

## Git/Bash
pathadd /mingw64/bin
pathadd "/cygdrive/c/Program Files/Git/mingw64/bin"

## VSCode
pathadd "/mnt/c/Program Files/Microsoft VS Code/bin"
pathadd "/cygdrive/c/Program Files/Microsoft VS Code/bin"

## Homebrew/Linux
pathadd /home/linuxbrew/.linuxbrew/bin
