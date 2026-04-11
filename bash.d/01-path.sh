#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib
### also: see ./99-path.sh

_bashrc_verbose "== Bash/Path/01"

# Check if 'grep -E' recognizes regexes
if   echo "/bin:/test" | /bin/grep -E "(^|:)/test($|:)" -q 2>/dev/null
then EGREP="/bin/grep -E"
elif echo "/bin:/test" | /usr/bin/grep -E "(^|:)/test($|:)" -q 2>/dev/null
then EGREP="/usr/bin/grep -E"
elif test -f /bin/egrep
then EGREP="/bin/egrep"
elif test -f /usr/bin/egrep
then EGREP="/usr/bin/egrep"
elif ommand -v ggrep
then EGREP="$(command -v ggrep)"
else EGREP="grep"
fi

_bashrc_debug "-- EGREP=[$EGREP]"

function pathadd() {
    if [ -d $1 ]
    then
        if ! echo $PATH | $EGREP "(^|:)$1($|:)" -q
        then
            if [ "$2" = "after" ]
            then PATH=$PATH:$1
            else PATH=$1:$PATH
            fi
        fi
    fi
}

function ldpathadd() {
    if [ -d $1 ]
    then
        if ! echo $LD_LIBRARY_PATH | $EGREP "(^|:)$1($|:)" -q
        then
            if [ "$2" = "after" ]
            then LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1
            else LD_LIBRARY_PATH=$1:$LD_LIBRARY_PATH
            fi
        fi
    fi
}

function manpathadd() {
    if [ -d $1 ]
    then
        if ! echo $MANPATH | $EGREP "(^|:)$1($|:)" -q
        then
            if [ "$2" = "after" ]
            then MANPATH=$MANPATH:$1
            else MANPATH=$1:$MANPATH
            fi
        fi
    fi
}

PATH=~/bin
pathadd /opt/local/bin
pathadd /opt/local/sbin   after
pathadd /usr/local/bin    after
pathadd /usr/local/sbin   after

pathadd /bin              after
pathadd /sbin             after
pathadd /usr/bin          after
pathadd /usr/sbin         after
pathadd /usr/X11/bin      after

# LD_LIBRARY_PATH=/opt/local/lib
# ldpathadd /usr/local/lib                after

MANPATH=/opt/local/share/man
manpathadd /usr/local/share/man   after
manpathadd /usr/share/man         after

export PATH LD_LIBRARY_PATH MANPATH

alias     path='IFS=: && echo path     ; for f in $PATH             ; do echo "    $f"; done'
alias   ldpath='IFS=: && echo ldpath   ; for f in $LD_LIBRARY_PATH  ; do echo "    $f"; done'
alias  manpath='IFS=: && echo manpath  ; for f in $MANPATH          ; do echo "    $f"; done'

# Find In Path
pathfind() {
  IFS=: && for p in $PATH
  do
  echo "    $p"
  test -f ${p}/${1} && echo "    ${p}/${1}"
  done
}

