#!/bin/bash

###
### mvf
### macos:~/oracle.rc.sh

EGREP=`which egrep`

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

sqlpathadd () {
    if [ -d $1 ]
    then if ! echo $SQLPATH | $EGREP -q "(^|:)$1($|:)" 
         then if [ "$2" = "after" ]
              then SQLPATH=$SQLPATH:$1
              else SQLPATH=$1:$SQLPATH
              fi
         fi
    fi
}

umask 002

export ORACLE_SID=orcl
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/10.2.0.4/db_1
export    NLS_LANG='AMERICAN_AMERICA.WE8ISO8859P1'

pathadd ${ORACLE_BASE}/bin
pathadd ${ORACLE_HOME}/bin
pathadd ${ORACLE_HOME}/dcm/bin
pathadd ${ORACLE_HOME}/opmn/bin

ldpathadd ${ORACLE_HOME}/lib
ldpathadd ${ORACLE_HOME}/rdbms/lib
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386/server

sqlpathadd ${HOME}/sql
sqlpathadd /work/mvdba/sql

export PATH
export LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib     # MacOS
export SQLPATH

unset pathadd
unset ldpathadd
unset sqlpathadd

                       export TNS_ADMIN=/var/opt/oracle/tns
[ ! -d $TNS_ADMIN ] && export TNS_ADMIN=$ORACLE_HOME/network/admin

export DISPLAY=:0
export TERM=xterm-color


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

alias   alert='ll      $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log ; wc -l !$'
alias  talert='tail -f $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log'
alias  valert='vim     $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log'
alias  sysdba='sqlplus -L / as sysdba'

function tnsping() {
    if [ "$2" ]
    then $ORACLE_HOME/bin/tnsping $1 $2
    else $ORACLE_HOME/bin/tnsping $1 10
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

function __ora_ps1() {
    if [ -d $ORACLE_HOME ]
    then
        if   [ $LOCAL      ]        # win32
        then echo "[w32::$LOCAL]"
        elif [ $TWO_TASK   ]        # unix
        then echo "[tns::$TWO_TASK]"
        elif [ $ORACLE_SID ]
        then echo "[sid::$ORACLE_SID]"
        fi
    fi
}

## http://laurentschneider.com/wordpress/2006/05/set-my-oracle_home-path-oracle_sid.html
p() {
    sqlplus -L -s "/ as sysdba" <<SQL | sed -n 's/@ //p'
        set echo off lin 9999 trimsp on feedb off head off pages 0 tab off
        col name for a25

        select '@',name, value 
          from v$parameter2 
         where upper(name) like upper('%$1%');
SQL
}
P() {
    sqlplus -L -s "/ as sysdba" <<SQL | sed -n 's/@ //p'
        set echo off lin 9999 trimsp on feedb off head off pages 0 tab off
        col name for a25

        select '@',ksppinm name,ksppstvl value 
          from x$ksppi join x$ksppcv using (inst_id,indx) 
         where upper(ksppinm) like upper('%$1%');
SQL
}
## http://laurentschneider.com/wordpress/2006/05/set-my-oracle_home-path-oracle_sid.html

## http://laurentschneider.blogspot.com/2006/05/ocm-preparation.html
    alias   abort='echo shutdown abort       |sqlplus -L -s / as sysdba'
    alias   mount='echo startup mount        |sqlplus -L -s / as sysdba'
    alias nomount='echo startup nomount quiet|sqlplus -L -s / as sysdba'
    alias startup='echo startup quiet        |sqlplus -L -s / as sysdba'
    alias    pmon='ps -ef | grep [p]mon'
## http://laurentschneider.blogspot.com/2006/05/ocm-preparation.html

# vim: ft=sh:

