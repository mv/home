#!/bin/bash

###
### mvf
### macos:~/oracle.rc.sh

export ORACLE_SID=orcl
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/10.2.0/db_1

export NLS_LANG='AMERICAN_AMERICA.WE8ISO8859P1'
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'

export  TNS_ADMIN=/u01/app/oracle/tns
[ ! -d $TNS_ADMIN    ] && export TNS_ADMIN=$ORACLE_HOME/network/admin

[   -z "$SSH_CLIENT" ] && export DISPLAY=:0 \
                       || export DISPLAY="`echo $SSH_CLIENT | awk '{ print $1 }'`:0"

[   -z "$TERM" ] && export TERM=vt100

### Oracle PATH's {
pathadd ${ORACLE_HOME}/bin
pathadd ${ORACLE_BASE}/bin
pathadd ${ORACLE_HOME}/dcm/bin
pathadd ${ORACLE_HOME}/opmn/bin
pathadd ${ORACLE_CRS_HOME}/bin
pathadd ${ORACLE_ASM_HOME}/bin

ldpathadd ${ORACLE_HOME}/lib
ldpathadd ${ORACLE_HOME}/rdbms/lib
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386
ldpathadd ${ORACLE_HOME}/jdk/jre/lib/i386/server
# }

export PATH
export LD_LIBRARY_PATH

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
    AIX)
        export LIBPATH=${ORACLE_HOME}/lib
        ;;
    HPUX)
        export SHLIB_PATH=${ORACLE_HOME}/lib
        ;;
esac
#}

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

export ORA_ALERT="$ORACLE_BASE/admin/$ORACLE_SID/bdump/alert_${ORACLE_SID}.log"
alias      alert='ls -l   $ORA_ALERT ;; wc -l   $ORA_ALERT ;; echo'
alias     talert='tail -f $ORA_ALERT'
alias     valert='vim     $ORA_ALERT'
# }

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

alias  ps1="export PS1='\u@\h:\w\n\$ '"
export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)") \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '

# vim: ft=sh foldlevel=0:

