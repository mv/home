#!/bin/bash

###
### mvf
### bashrc lib

# Net & processes

function ifconfig {
    if [ "$1" ]
    then /sbin/ifconfig $1
    else /sbin/ifconfig -a
    fi
}

function psg {
    if [ "$1" ]
    then ps -ef | \grep -v grep | egrep "$1"
    else ps -ef | more
    fi
    # ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

case `uname -s` in
    Darwin | FreeBSD | OpenBSD) # {
        alias   netr='netstat -rn -f inet'
        alias   neta='netstat -an -f inet'
        alias   netl='netstat -an -f inet | grep -i listen'
        alias   ifcf='ifconfig en0 ; ifconfig en1'

        alias    top='top -ocpu -Otime -X'         # MacOS: order by cpu and then time, old display format
        alias    msg='tail -f /var/log/system.log' # MacOS

        ;; # }
    SunOS) # {
        alias   netr='netstat -rn -f inet'
        alias   neta='netstat -an -f inet'
        alias   netl='netstat -an -f inet | grep -i listen'
        alias   ifcf='ifconfig hme0 ; ifconfig bfe0'

        alias    top='top -Z -B'
        alias prstat='prstat -a'
        alias    msg='tail -f /var/adm/messages'
        ;; # }
    Linux) # {
        alias   neta='netstat -rn | grep -w tcp'
        alias   neta='netstat -an | grep -w tcp'
        alias   netl='netstat -an | grep -i listen'
        alias   ifcf='ifconfig eth0 ; ifconfig eth1'

        alias    top='top -Z -B'                    # color + bold
        alias    msg='tail -f /var/log/messages'
        ;; # }
    *) ;;
esac

alias      ifa='/sbin/ifconfig -a | egrep "inet "'
alias      ifc='/sbin/ifconfig -a | egrep "inet |^[a-z]"'
alias       ip='curl -s "http://whatismyip.org" -w "\n"'
alias   sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 '

alias memusage='ps -o rss,command -waxc | sort -n'
alias     nmap='sudo nmap -v -A'
alias    nmap0='sudo nmap -v -A -P0'

alias      rdt='rdesktop -d UOFA -g 1024x768 -u '

which rlwrap > /dev/null && alias nslookup='rlwrap nslookup'

# vim: ft=sh:

