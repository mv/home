#!/bin/bash

###
### mvf
### bashrc lib

# *PATH {
[ -x /bin/egrep     ] && EGREP=/bin/egrep
[ -x /usr/bin/egrep ] && EGREP=/usr/bin/egrep

pathadd () {
    if [ -d $1 ]
    then if ! echo $PATH | $EGREP -q "(^|:)$1($|:)"
         then if [ "$2" = "after" ]
              then PATH=$PATH:$1
              else PATH=$1:$PATH
              fi
        fi
    fi
}

ldpathadd () {
    if [ -d $1 ]
    then if ! echo $LD_LIBRARY_PATH | $EGREP -q "(^|:)$1($|:)"
         then if [ "$2" = "after" ]
              then LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1
              else LD_LIBRARY_PATH=$1:$LD_LIBRARY_PATH
              fi
         fi
    fi
}

manpathadd () {
    if [ -d $1 ]
    then if ! echo $MANPATH | $EGREP -q "(^|:)$1($|:)"
         then if [ "$2" = "after" ]
              then MANPATH=$MANPATH:$1
              else MANPATH=$1:$MANPATH
              fi
         fi
    fi
}

PATH=~/bin
pathadd /opt/local/bin
pathadd /opt/local/sbin                       after
pathadd /Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home/bin after
pathadd /usr/local/bin                        after
pathadd /usr/local/sbin                       after
pathadd /Developer/usr/bin                    after
pathadd /Developer/usr/sbin                   after
pathadd /bin                                  after
pathadd /sbin                                 after
pathadd /usr/bin                              after
pathadd /usr/sbin                             after
pathadd /usr/X11/bin                          after
pathadd /usr/local/Cellar/ruby/2.0.0-p247/bin
pathadd /usr/local/heroku/bin/

# LD_LIBRARY_PATH=/opt/local/lib
# ldpathadd /usr/local/lib                after

MANPATH=/opt/local/share/man
manpathadd /usr/local/share/man         after
manpathadd /Developer/usr/share/man     after
manpathadd /usr/share/man               after

export PATH LD_LIBRARY_PATH MANPATH

alias     path='IFS=: && echo path     ; for f in $PATH             ; do echo "    $f"; done'
alias   ldpath='IFS=: && echo ldpath   ; for f in $LD_LIBRARY_PATH  ; do echo "    $f"; done'
alias dyldpath='IFS=: && echo dyldpath ; for f in $DYLD_LIBRARY_PATH; do echo "    $f"; done'
alias  manpath='IFS=: && echo manpath  ; for f in $MANPATH          ; do echo "    $f"; done'

# Find In Path
#fip()  { find ${PATH//:/ } -name \*${1}\*; }
#filp() { find ${LD_LIBRARY_PATH//:/ } -name \*${1}\*; }

# vim: ft=sh:

