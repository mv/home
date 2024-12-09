#!/bin/bash
# vim:ft=sh:
#
# Win/WSL/Fedora
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com


## WSL
pathadd /home/linuxbrew/.linuxbrew/bin

### set default browser to be open from terminal
_choosy="/mnt/c/Program Files/BrowserPicker/BrowserPicker.exe"
if [ -f "${_choosy}" ]
then export BROWSER="${_choosy}"
fi


## Git/Bash
pathadd /mingw64/bin
pathadd "/c/Program Files/Microsoft VS Code/bin"


## Cygwin
pathadd "/cygdrive/c/Program Files/Git/mingw64/bin"
pathadd "/cygdrive/c/Program Files/Microsoft VS Code/bin"
