#!/bin/bash

###
### mvf
### macos:~/oracle.rc.sh

pathadd () {
    if [ -d $1 ]
    then if ! echo $PATH | /usr/bin/egrep -q "(^|:)$1($|:)" 
         then if [ "$2" = "after" ]
              then PATH=$PATH:$1
              else PATH=$1:$PATH
              fi
        fi
    fi
}

ldpathadd () {
    if [ -d $1 ]
    then if ! echo $LD_LIBRARY_PATH | /usr/bin/egrep -q "(^|:)$1($|:)" 
         then if [ "$2" = "after" ]
              then LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1
              else LD_LIBRARY_PATH=$1:$LD_LIBRARY_PATH
              fi
         fi
    fi
}

umask 002

export ORACLE_SID=orcl
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/10.2.0.4/db_1

pathadd ${ORACLE_BASE}/bin
pathadd ${ORACLE_HOME}/bin
pathadd ${ORACLE_HOME}/dcm/bin
pathadd ${ORACLE_HOME}/opmn/bin

ldpathadd ${ORACLE_HOME}/lib
ldpathadd ${ORACLE_HOME}/rdbms/lib
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386/server

export PATH
export LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib

                       export TNS_ADMIN=/var/opt/oracle/tns
[ ! -d $TNS_ADMIN ] && export TNS_ADMIN=$ORACLE_HOME/network/admin

export DISPLAY=:0
export TERM=xterm-color

[ -d ${HOME}/sql ] && export SQLPATH=${HOME}/sql

alias orabase='cd $ORACLE_BASE'
alias oradmin='cd $ORACLE_BASE/admin/$ORACLE_SID'
alias   pfile='cd $ORACLE_BASE/admin/$ORACLE_SID/pfile'
alias   adump='cd $ORACLE_BASE/admin/$ORACLE_SID/adump'
alias   bdump='cd $ORACLE_BASE/admin/$ORACLE_SID/bdump'
alias   cdump='cd $ORACLE_BASE/admin/$ORACLE_SID/cdump'
alias   udump='cd $ORACLE_BASE/admin/$ORACLE_SID/udump'

alias orahome='cd $ORACLE_HOME'
alias  orabin='cd $ORACLE_HOME/bin'
alias  oradbs='cd $ORACLE_HOME/dbs'
alias   rdbms='cd $ORACLE_HOME/rdbms/admin'
alias     tns='cd $TNS_ADMIN'

alias  alert='tail -f $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log'
alias sysdba='sqlplus / as sysdba'

function tnsping() {
    if [ -z "$2" ]
    then $ORACLE_HOME/bin/tnsping $1 10
    else $ORACLE_HOME/bin/tnsping $1 $2
    fi
}

## RAC
_set_if() {
    if [ -d $2 ]
    then eval 'export $1=$2 ; export PATH=$2/bin:$PATH'
    fi
}

_set_if ORA_ASM_HOME ${ORACLE_BASE}/product/10.2.0.4/asm_1
_set_if ORA_CRS_HOME ${ORACLE_BASE}/product/10.2.0.4/crs_1

# vim: ft=sh:

