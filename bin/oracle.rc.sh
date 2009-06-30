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

alias     path='IFS=: && echo path     ; for f in $PATH             ; do echo "    $f"; done'
alias   ldpath='IFS=: && echo ldpath   ; for f in $LD_LIBRARY_PATH  ; do echo "    $f"; done'
alias  manpath='IFS=: && echo manpath  ; for f in $MANPATH          ; do echo "    $f"; done'
alias dyldpath='IFS=: && echo dyldpath ; for f in $DYLD_LIBRARY_PATH; do echo "    $f"; done'

export ORACLE_SID=orcl
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/10.2.0/db_1

export NLS_LANG='AMERICAN_AMERICA.WE8ISO8859P1'
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'

## RAC #{
_set_if() {
    if [ -d $2 ]
    then # eval 'export $1=$2 ; export PATH=$2/bin:$PATH'
        eval 'export $1=$2'
    fi
}

_set_if ORA_ASM_HOME ${ORACLE_BASE}/product/10.2.0/asm_1
_set_if ORA_CRS_HOME ${ORACLE_BASE}/product/10.2.0/crs_1
# }

### Oracle PATH's {
pathadd ${ORACLE_BASE}/bin
pathadd ${ORACLE_HOME}/bin
pathadd ${ORACLE_HOME}/dcm/bin
pathadd ${ORACLE_HOME}/opmn/bin
pathadd ${ORACLE_CRS_HOME}/bin
pathadd ${ORACLE_ASM_HOME}/bin

ldpathadd ${ORACLE_HOME}/lib
ldpathadd ${ORACLE_HOME}/rdbms/lib
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386/server

sqlpathadd /work/mvdba/sql
sqlpathadd ${ORACLE_BASE}/sql
sqlpathadd ${ORACLE_BASE}/scripts
# }

export PATH
export LD_LIBRARY_PATH
export SQLPATH

### Multi-OS # {
case `uname -s` in
    Darwin)
        # MacOS
        export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib     # MacOS
        # Must match kern.maxprocperuid
        ulimit -Hu 512
        ulimit -Su 512
        # Must match kern.maxfilesperproc
        ulimit -Hn 65536
        ulimit -Sn 65536
        ;;
esac
#}

unset pathadd
unset ldpathadd
unset sqlpathadd

                          export TNS_ADMIN=/u01/app/oracle/tns
[ ! -d $TNS_ADMIN    ] && export TNS_ADMIN=$ORACLE_HOME/network/admin

[   -z "$SSH_CLIENT" ] && export DISPLAY=:0 \
                       || export DISPLAY="`echo $SSH_CLIENT | awk '{ print $1 }'`:0"

export TERM=xterm-color
umask 002

# MVF: Aliases on ORACLE_BASE e ORACLE_HOME {
alias orabase='cd $ORACLE_BASE'
alias oradmin='cd $ORACLE_BASE/admin'
alias  oraetc='cd $ORACLE_BASE/etc'
alias  oralog='cd $ORACLE_BASE/log'
alias  orainv='cd $ORACLE_BASE/oraInventory'
alias  orasid='cd $ORACLE_BASE/admin/$ORACLE_SID'
alias   pfile='cd $ORACLE_BASE/admin/$ORACLE_SID/pfile'
alias   adump='cd $ORACLE_BASE/admin/$ORACLE_SID/adump'
alias   bdump='cd $ORACLE_BASE/admin/$ORACLE_SID/bdump'
alias   cdump='cd $ORACLE_BASE/admin/$ORACLE_SID/cdump'
alias   udump='cd $ORACLE_BASE/admin/$ORACLE_SID/udump'

alias orahome='cd $ORACLE_HOME'
alias  orabin='cd $ORACLE_HOME/bin'
alias     dbs='cd $ORACLE_HOME/dbs'
alias   rdbms='cd $ORACLE_HOME/rdbms/admin'
alias  oratns='cd $ORACLE_HOME/network/admin'
alias     tns='cd $TNS_ADMIN'

alias   alert='wc -l   $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log'
alias  talert='tail -f $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log'
alias  valert='vim     $ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log'
# }

## Goodies
function sqlplus() {
    # http://www.oracledba.ru/notes_sqlplus_readline_en.html
    if which rlwrap 2>&1 > /dev/null
    then
        echo ; echo "rlwrap loaded...."
        rlwrap $ORACLE_HOME/bin/sqlplus $@
#       rlwrap -b '' -f ~/sql/sqlplus.dict $ORACLE_HOME/bin/sqlplus $@
    else
        $ORACLE_HOME/bin/sqlplus $@
    fi
}

function rman() {
    if which rlwrap 2>&1 > /dev/null
    then
        echo ; echo "rlwrap loaded...."
        rlwrap $ORACLE_HOME/bin/rman $@
    else
        $ORACLE_HOME/bin/rman $@
    fi
}

function lsnr() {
    if [ "$1" == "restart" ]
    then
        $ORACLE_HOME/bin/lsnrctl stop
        $ORACLE_HOME/bin/lsnrctl start
    fi
    if which rlwrap 2>&1 > /dev/null
    then
        echo ; echo "rlwrap loaded...."
        rlwrap $ORACLE_HOME/bin/lsnrctl $@
    else
        $ORACLE_HOME/bin/lsnrctl $@
    fi
}

function tnsping() {
    if [ "$2" ]
    then $ORACLE_HOME/bin/tnsping $1 $2
    else $ORACLE_HOME/bin/tnsping $1 10
    fi
}

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

## http://laurentschneider.com/wordpress/2006/05/set-my-oracle_home-path-oracle_sid.html #{
p() {
    sqlplus -L -s "/ as sysdba" <<SQL | sed -n 's/@ //p'
        set echo off lin 9999 trimsp on feedb off head off pages 0 tab off
        col name for a25

        select '@',name, value from v$parameter2 where upper(name) like upper('%$1%');

        SELECT name,value,'MEMORY' as scope FROM v$parameter   upper(name) like upper('%$1%')
        UNION
        SELECT name,value,'SPFILE' as scope FROM v$spparameter upper(name) like upper('%$1%');

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
## http://laurentschneider.com/wordpress/2006/05/set-my-oracle_home-path-oracle_sid.html #}

alias sqlplus='sqlplus -L '
alias  sysdba='sqlplus / as sysdba'
alias sysoper='sqlplus / as sysoper'

## http://laurentschneider.blogspot.com/2006/05/ocm-preparation.html #{
    alias startup='echo startup  quiet        |sqlplus -L -s / as sysdba'
    alias startup='echo startup               |sqlplus -L    / as sysdba'
    alias nomount='echo startup  nomount quiet|sqlplus -L -s / as sysdba'
    alias nomount='echo startup  nomount      |sqlplus -L    / as sysdba'
    alias   mount='echo startup  mount        |sqlplus -L    / as sysdba'
    alias   abort='echo shutdown abort        |sqlplus -L    / as sysdba'
    alias   immed='echo shutdown immediate    |sqlplus -L    / as sysdba'
    alias    pmon='ps -ef | egrep [sp]mon'
## http://laurentschneider.blogspot.com/2006/05/ocm-preparation.html #}

alias  ps1="export PS1='\u@\h:\w\n\$ '"
export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)") \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '

# vim: ft=sh foldlevel=0:

