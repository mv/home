#!/bin/bash
#
# Open MacVim-alloy in my workdir
#
# 2018-09

workdir="~/WorkDocs/amzn/customers/"

cd "${workdir}" 2>/dev/null
~/App/Dev/MacVim-alloy.app/Contents/MacOS/MacVim &

