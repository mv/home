# Applications
    source /u02/app/fsw2/fsw2appl/APPSORA.env

    _SID=`echo $CONTEXT_NAME | awk -F _ '{print $1}'`
    export SCRIPTS=$COMMON_TOP/admin/scripts/$CONTEXT_NAME
    export    LOGS=$APPL_TOP/admin/$_SID/log
    unset _SID

    export PATH=$PATH:$SCRIPTS
    export NLS_DATE_FORMAT="dd/mm/yyyy"

    # Graphics MDB do Projeto
    MDB_GRAPH="/u02/app/devfs/devfsappl/mdb/11.5.0/graphs"
    if ! echo $GRAPHICS60_PATH | grep $MDB_GRAPH > /dev/null
    then
        export GRAPHICS60_PATH=$MDB_GRAPH:$GRAPHICS60_PATH
    fi

# Applications end

# unset USERNAME
umask 002

alias  cdlog='cd $LOGS'
alias  cdtop='cd $APPL_TOP'
alias  cdcom='cd $COMMON_TOP'
alias  cdias='cd $ORACLE_HOME/../iAS'

alias  adlgi='tail -100f $LOGS/adpatch.lgi   | egrep -v "^\s*$"'
alias  adlog='tail -100f $LOGS/adpatch.log   | egrep -v "^\s*$"'
alias adwlog='tail -100f $LOGS/adwork001.log | egrep -v "^\s*$"'
alias    adw='adwlog | egrep "^Package|^Time|^sqlplus|[Ee]rror|Generated|[Cc]reated|MDB_"'

if [ -f /usr/bin/multitail -o -f ~/bin/multitail ]
then
  #alias mlog='multitail -T -v -ec "/^\s*$/" $LOGS/adpatch.log -v -ec "/^\s*$/" $LOGS/adpatch.lgi -ts $LOGS/adwork001.log'
  alias mlog='multitail -T -v -ec "/^\s*$/" $LOGS/adpatch.lgi -v -ec "/^\s*$/" $LOGS/adwork001.log '
fi


if [ -f /usr/bin/multitail ]
then
    #alias mlog='multitail -T -v -ec "/^\s*$/" $LOGS/adpatch.log -v -ec "/^\s*$/" $LOGS/adpatch.lgi -ts $LOGS/adwork001.log'
    alias mlog='multitail -T -v -ec "/^\s*$/" $LOGS/adpatch.lgi -v -ec "/^\s*$/" $LOGS/adwork001.log '
fi

if [ -f ~/bin/xtail.pl ]
then
    alias xlog='xtail.pl $LOGS/adpatch.lgi $LOGS/adwork001.log '
fi



function adpopen() {

    [ -z "$1" ] && {
        echo
        echo "    Usage: adpopen <patch zip>"
        echo
        return
    }

    patch=${1%.*}
    unzip ${patch}.zip && cd $patch
}


function adpexec() {

    [ -z "$1" ] && {
        echo
        echo "    Usage: adpexec <patch zip>"
        echo
        return
    }

    patch=${1%.*}
    unzip ${patch}.zip && cd $patch && adp.sh u*drv
}

