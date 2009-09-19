#!/bin/bash

###
### mvf
### macos:~/bin/oracle.alias.rc.sh

alias  sysdba='sqlplus / as sysdba'
alias sysoper='sqlplus / as sysoper'

## Goodies

# rlwrap # {
# Ref: http://www.oracledba.ru/notes_sqlplus_readline_en.html
# rlwrap -b '' -f ~/sql/sqlplus.dict $ORACLE_HOME/bin/sqlplus $@

if which rlwrap 2>&1 > /dev/null
then
#   printf "\nrlwrap loaded....\n"
    alias sqlplus='rlwrap $ORACLE_HOME/bin/sqlplus -L'
    alias    rman='rlwrap $ORACLE_HOME/bin/rman'
    alias lsnrctl='rlwrap $ORACLE_HOME/bin/lsnrctl'
    alias tnsping='rlwrap $ORACLE_HOME/bin/tnsping'
else
    alias sqlplus='$ORACLE_HOME/bin/sqlplus -L'
    alias    rman='$ORACLE_HOME/bin/rman'
    alias lsnrctl='$ORACLE_HOME/bin/lsnrctl'
    alias tnsping='$ORACLE_HOME/bin/tnsping'
fi
# }

function lsnr() {
    if [ "$1" == "restart" ]
    then
        $ORACLE_HOME/bin/lsnrctl stop  $@
        $ORACLE_HOME/bin/lsnrctl start $@
    else
        $ORACLE_HOME/bin/lsnrctl $@
    fi
}

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

# SQLPATH # {
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

sqlpathadd /work/mv-dba/sql
sqlpathadd ${ORACLE_BASE}/sql
sqlpathadd ${ORACLE_BASE}/scripts
export SQLPATH

alias sqlpath='IFS=: && echo sqlpath  ; for f in $SQLPATH ; do echo "    $f"; done'
# }

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

## mvdba proxy user {
alias  abdh1='~/bin/mvdba.sh ~/config/ora-mvdba-abdh1.txt'
alias  abdh2='~/bin/mvdba.sh ~/config/ora-mvdba-abdh2.txt'
alias abdps1='~/bin/mvdba.sh ~/config/ora-mvdba-abdps1.txt'
alias abdps2='~/bin/mvdba.sh ~/config/ora-mvdba-abdps2.txt'
alias  dev01='~/bin/mvdba.sh ~/config/ora-mvdba-dev01.txt'
# }

# vim: ft=sh foldlevel=0:

