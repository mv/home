#!/bin/bash

###
### mvf
### macos:~/oracle.rc.sh

export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/10.2.0.4/client_1

export NLS_LANG='AMERICAN_AMERICA.WE8ISO8859P1'
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'

export  TNS_ADMIN=/u01/app/oracle/tns
[ ! -d $TNS_ADMIN    ] && export TNS_ADMIN=$ORACLE_HOME/network/admin

### Oracle PATH's {
[ -d ${ORACLE_BASE}/bin ] && echo $PATH            | grep ${ORACLE_BASE}/bin || export PATH=$PATH:${ORACLE_BASE}/bin
[ -d ${ORACLE_HOME}/bin ] && echo $PATH            | grep ${ORACLE_HOME}/bin || export PATH=$PATH:${ORACLE_HOME}/bin
[ -d ${ORACLE_HOME}/lib ] && echo $LD_LIBRARY_PATH | grep ${ORACLE_HOME}/lib || export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ORACLE_HOME}/bin

### Multi-OS # {
case `uname -s` in
    Darwin)
        # MacOS
        export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib     # MacOS
        # Must match kern.maxprocperuid
#       ulimit -Hu 512
#       ulimit -Su 512
        # Must match kern.maxfilesperproc
#       ulimit -Hn 10240
#       ulimit -Sn 10240
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
alias  oraetc='cd $ORACLE_BASE/etc'
alias  oralog='cd $ORACLE_BASE/log'
alias  orainv='cd $ORACLE_BASE/oraInventory'

alias orahome='cd $ORACLE_HOME'
alias  orabin='cd $ORACLE_HOME/bin'
alias     dbs='cd $ORACLE_HOME/dbs'
alias   rdbms='cd $ORACLE_HOME/rdbms/admin'
alias  oratns='cd $ORACLE_HOME/network/admin'
alias     tns='cd $TNS_ADMIN'

# }

# alias  ps1="export PS1='\u@\h:\w\n\$ '"
# export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)") \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '

# vim: ft=sh foldlevel=0:

