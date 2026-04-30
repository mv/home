#!/bin/bash

###
### mvf
### macos:~/alias.rc.sh

## Applications
_alias_if() {
    if [ -f $2 ]
    then 
        cmd="cd /tmp && nohup $2 &"
        cmd="$1=$cmd"
        eval "alias '$cmd'"
    fi
}

_alias_if sqldeveloper /Users/mferreira/App/SQLDeveloper.app/Contents/MacOS/sqldeveloper.sh

# vim: ft=sh:

