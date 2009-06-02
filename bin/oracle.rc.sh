#!/bin/bash

###
### mvf
### macos:~/oracle.rc.sh

umask 002

export ORACLE_SID=orcl
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/10.2.0.4/db_1

PATH=${ORACLE_HOME}/bin:$PATH
PATH=${ORACLE_BASE}/bin:$PATH
export PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ORACLE_HOME}/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ORACLE_HOME}/rdbms/lib
if [ -d ${ORACLE_HOME}/jdk/jre/lib/i386 ]
then
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ORACLE_HOME}/jdk/jre/lib/i386
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ORACLE_HOME}/jdk/jre/lib/i386/server
fi
export   LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib

TNS_ADMIN=/var/opt/oracle/tns
if [ ! -d $TNS_ADMIN ]
then TNS_ADMIN=$ORACLE_HOME/network/admin
fi
export TNS_ADMIN

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

if [ ! -n $ORA_CRS_HOME ]
then
    PATH=$PATH:$ORACLE_HOME/dcm/bin
    PATH=$PATH:$ORACLE_HOME/opmn/bin
    export PATH
fi

# vim: ft=sh:

