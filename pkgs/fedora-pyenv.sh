#!/bin/bash
#


## Build:
##   https://github.com/pyenv/pyenv/wiki#suggested-build-environment

echo sudo dnf install make gcc patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2

echo
echo "(if install problem)"
echo "  https://github.com/pyenv/pyenv/issues/2823"
echo "  brew unlink pkg-config"
echo
echo "pyenv update"
echo

pyenv install -l | grep -e '^  3.[12]' | tail -20

echo
echo pyenv install 3.13
echo pyenv versions
echo pyenv global 3.13
echo pip list
echo pip install ipython virtualenv
echo pip list
echo
