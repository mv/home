#!/bin/bash
# vim:ft=sh:
#
# Win/WSL/Fedora
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com


### set default browser to be open from terminal
_choosy="/mnt/c/Program Files/BrowserPicker/BrowserPicker.exe"
if [ -f "${_choosy}" ]
then export BROWSER="${_choosy}"
fi


## WSL paths
pathadd "/mnt/c/Program Files/Git/mingw64/bin"
pathadd "/mnt/c/Program Files/Microsoft VS Code/bin"
pathadd "/mnt/c/Windows"           after
pathadd "/mnt/c/Windows/System32"  after

## if Git/Bash (using MINGW64 paths)
pathadd "/mingw64/bin"
pathadd "/c/Program Files/Microsoft VS Code/bin"
pathadd "/c/Windows"               after
pathadd "/c/Windows/System32"      after

## if Cygwin (using cygwin paths)
pathadd "/cygdrive/c/Program Files/Git/mingw64/bin"
pathadd "/cygdrive/c/Program Files/Microsoft VS Code/bin"
pathadd "/cygdrive/c/Windows"           after
pathadd "/cygdrive/c/Windows/System32"  after

## Homebrew (on top)
pathadd "/home/linuxbrew/.linuxbrew/bin"
