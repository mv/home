#!/bin/bash

###
### mvf
### macos:~/.bashrc

# *PATH
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
pathadd /usr/local/bin
pathadd /usr/local/sbin
pathadd /opt/local/bin
pathadd /opt/local/sbin
pathadd /opt/local/lib/mysql5/bin
pathadd /Developer/usr/bin
pathadd /Developer/usr/sbin
pathadd /bin
pathadd /sbin
pathadd /usr/bin
pathadd /usr/sbin
pathadd /usr/X11/bin

LD_LIBRARY_PATH=/usr/local/lib
ldpathadd /usr/local/apache/lib
ldpathadd /usr/local/BerkeleyDB.4.6/lib
ldpathadd /opt/local/lib

MANPATH=/usr/local/share/man
manpathadd /opt/local/share/man
manpathadd /Developer/usr/share/man
manpathadd /usr/share/man

export PATH LD_LIBRARY_PATH MANPATH

# Interactive operation...
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

if which column > /dev/null
then
    alias mount='mount | column -t'
fi

alias less='less -r'                    # raw control characters
alias grep='egrep --color'              # show differences in colour

case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias ls='ls -AFhG'
        ;;
    Linux)
        alias ls='ls -AFh --color=auto --time-style=long-iso'
        ;;
    *)
        alias ls='ls -AF'
        ;;
esac

[ `which gls` ] && alias ls='gls -AFh --color=auto'

alias  ll='ls -l'                       # long list
alias  lr='ls -ltr'                     # long list
alias  la='ls -A'                       # all but . and ..
alias   l='/bin/ls'

alias rehash='source ~/.bashrc'

# dir/files
function c  {
    cd "$1" && ls
}
function mkcd  {
    mkdir -p "$1" && cd "$1"
}

alias     ..='\cd .. && ls'
alias   cd..='\cd .. && ls'
alias  findd='find . -type d | egrep -i '
alias  findf='find . -type f | egrep -i '
alias    chg='find .         -exec chmod g+w,o-w {} \;'
alias    chd='find . -type d -exec chmod 775 {} \;'
alias    chf='find . -type f -exec chmod 664 {} \;'
alias     kd='find . -type d | wc -l'
alias     kf='find . -type f | wc -l'
alias kountd='for f in *; do printf "%30s %5d\n" $f `find $f -type d | wc -l`; done'
alias kountf='for f in *; do printf "%30s %5d\n" $f `find $f -type f | wc -l`; done'

alias mvhome='cd ~/Work/mv_home'
alias  mvvim='cd ~/Work/mv_vim'
alias  mvdba='cd ~/Work/mvdba'

alias  env='env | sort'
alias     path='IFS=: && for f in $PATH; do echo $f; done'
alias   ldpath='IFS=: && for f in $LD_LIBRARY_PATH; do echo $f; done'
alias dyldpath='IFS=: && for f in $DYLD_LIBRARY_PATH; do echo $f; done'
alias  manpath='IFS=: && for f in $MANPATH; do echo $f; done'

# net & processes
case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias   netr='netstat -rn -f inet'
        alias   neta='netstat -an -f inet'
        alias   netl='netstat -an -f inet | grep -i listen'
        alias   ifcf='ifconfig en0 ; ifconfig en1'

        alias    top='top -ocpu -Otime -X'         # MacOS: order by cpu and then time, old display format
        alias    msg='tail -f /var/log/system.log' # MacOS
        ;;
    SunOS)
        alias   netr='netstat -rn -f inet'
        alias   neta='netstat -an -f inet'
        alias   netl='netstat -an -f inet | grep -i listen'
        alias   ifcf='ifconfig hme0 ; ifconfig bfe0'

        alias    top='top -Z -B'
        alias prstat='prstat -a'
        alias    msg='tail -f /var/adm/messages'
        ;;
    Linux)
        alias   neta='netstat -rn | grep -w tcp'
        alias   neta='netstat -an | grep -w tcp'
        alias   netl='netstat -an | grep -i listen'
        alias   ifcf='ifconfig eth0 ; ifconfig eth1'

        alias    top='top -Z -B'                    # color + bold
        alias    msg='tail -f /var/log/messages'
        ;;
    *)
        ;;
esac

alias sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 '
alias   ifca='ifconfig -a'

function hcount {
    [ "$1" ] && _line=$1 || _line=10
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -${_line}
}

function psg {
    if [ "$1" ]
    then ps -ef | \grep -v grep | grep "$1"
    else ps -ef | more
    fi
}

function psga {
    if [ "$1" ] ; then ps -ef | grep -v grep | grep "$1" | awk '{print $2}'
    fi
}

function psgk {
    if [ "$1" ] ; then ps -ef | grep -v grep | grep "$1" | awk '{print $2}' | xargs kill
    fi
}

# vcs
[ `which svn` ] && alias    pset='svn propset svn:keywords "Id URL Rev Author Date"'
[ `which svk` ] && alias svkpset='svk propset svn:keywords "Id URL Rev Author Date"'

if which git > /dev/null
then
    alias  gb='git branch'
    alias gba='git branch -a'
    alias  gc='git commit -v'
    alias gpp='git pull && git push'
    alias  gp='git pull'
    alias gst='git status'
    alias  gd='git diff | vim -'

    alias gitk='gitk --all &'
    alias gitclean='git remote prune origin && git remote update'
fi


# Others
alias dtfile='date "+%Y-%m-%d_%H%M"'
alias  dtiso='date "+%Y-%m-%d %X"'
alias  dtdns='date "+%Y%m%d%H%M%S"'

# vim
export EDITOR=vim

case `uname -s` in
    Darwin)
        #lias   vi='~/App/MacVim.app/Contents/MacOS/Vim'
        alias  vim='~/App/MacVim.app/Contents/MacOS/Vim'
        alias gvim='~/App/MacVim.app/Contents/MacOS/Vim -g'
        alias tvim='~/App/MacVim.app/Contents/MacOS/Vim --remote-tab'
        alias vimd='~/App/MacVim.app/Contents/MacOS/Vim -g -d'

        export VIM_APP_DIR=~/App
        export MANPAGER="col -b | ~/bin/view  -c 'set ft=man nomod nolist' -"
        export MANPAGER="col -b | ~/bin/mview -c 'set ft=man nomod nolist' -"
        ;;
    *)
        export MANPAGER="col -b | view  -c 'set ft=man nomod nolist' -"
        ;;
esac

[ -f ~/auth/webco.bfa ] && alias auth='vim ~/auth/webco.bfa'

# Externals
# [ -f /opt/local/etc/bash_completion ] && source /opt/local/etc/bash_completion
  [ -f ~/bin/git-completion.sh        ] && source ~/bin/git-completion.sh
  [ -f ~/bin/oracle.rc.sh             ] && source ~/bin/oracle.rc.sh


# Prompt
# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#   \[\e[01;36m\]
PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\]\n\$ '

  type __git_ps1 > /dev/null && PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\]$(__git_ps1 "(%s)")\n\$ '
  type __ora_ps1 > /dev/null && PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\] $(__ora_ps1)\n\$ '

  type __ora_ps1 > /dev/null && \
  type __ora_ps1 > /dev/null && PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\]$(__git_ps1 "(%s)") $(__ora_ps1)\n\$ '

export PS1

set -o vi

# vim: ft=sh:

