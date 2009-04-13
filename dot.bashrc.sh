#!/bin/bash

###
### mvf
### macos:~/.bashrc

# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#   \[\e[01;36m\]
export PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\]\n\$ '
export PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\]$(__git_ps1 "(%s)")\n\$ '

# System-wide .bashrc file

# Interactive operation...
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

alias less='less -r'                    # raw control characters
alias grep='egrep --color'              # show differences in colour

alias  ls='ls -hAFG'
alias  ls='gls -hF --color'             # MacOS/Joyent::OpenSolaris
alias   l='/bin/ls'
alias  ll='ls -l'                       # long list
alias  lr='ls -ltr'                     # long list
alias  la='ls -A'                       # all but . and ..

alias rehash='source ~/.bashrc'

# dir/files
alias      ..="\cd .. ; ls"
alias    cd..="\cd .. ; ls"

function mkcd  {  
    mkdir -p "$1" && cd "$1"
}

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

# net
alias sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 '
alias   netr='netstat -rn -f inet'
alias   neta='netstat -an -f inet'
alias   netl='netstat -an -f inet | grep -i listen'
alias  ifcfl='ifconfig en0 ; ifconfig en1'
alias  ifcfa='ifconfig -a'

# processes
alias    top='top -ocpu -Otime -X'         # MacOS: order by cpu and then time, old display format
alias    msg='tail -f /var/log/system.log' # MacOS

function psg {
    if [ "$1" ] ;
    then ps -ef | grep -v grep  | grep "$1"
    else ps -ef | more
    fi
}

function psga {
    if [ "$1" ] ; then ps -ef | grep -v grep  | grep "$1" | awk '{print $2}'
    fi
}

function psgk {
    if [ "$1" ] ; then ps -ef | grep -v grep  | grep "$1" | awk '{print $2}' | xargs kill
    fi
}

# vcs
alias    pset='svn propset svn:keywords "Id URL Rev Author Date"'
alias svkpset='svk propset svn:keywords "Id URL Rev Author Date"'

alias  gb='git branch'
alias gba='git branch -a'
alias  gc='git commit -v'
alias gpp='git pull && git push'
alias  gp='git pull'
alias gst='git status'
alias  gd='git diff | vim -'

alias gitclean='git remote prune origin && git remote update'

[ -f ~/bin/git-completion.sh ] && source ~/bin/git-completion.sh

# Security
alias auth='vim ~/auth/webco.bfa'

# Others
alias dtfile='date "+%Y-%m-%d_%H%M"'
alias  dtiso='date "+%Y-%m-%d %X"'
alias  dtdns='date "+%Y%m%d%H%M%S"'

# *PATH
PATH=~/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/opt/local/lib/mysql5/bin
PATH=$PATH:/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/Developer/usr/bin
PATH=$PATH:/Developer/usr/sbin
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/X11/bin

LD_LIBRARY_PATH=/usr/local/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/apache/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/BerkeleyDB.4.6/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib

MANPATH=/usr/local/share/man
MANPATH=$MANPATH:/opt/local/share/man
MANPATH=$MANPATH:/Developer/usr/share/man
MANPATH=$MANPATH:/usr/share/man

export PATH LD_LIBRARY_PATH MANPATH
export MANPAGER="col -b | ~/bin/view -c 'set ft=man nomod nolist' -"
export MANPAGER="col -b | ~/bin/mview -c 'set ft=man nomod nolist' -"

export VIM_APP_DIR=~/App
export EDITOR=vim
alias   vi='~/App/MacVim.app/Contents/MacOS/Vim '
alias  vim='~/App/MacVim.app/Contents/MacOS/Vim -g'
alias gvim='~/App/MacVim.app/Contents/MacOS/Vim -g'
alias tvim='~/App/MacVim.app/Contents/MacOS/Vim --remote-tab'


# if [ -f /opt/local/etc/bash_completion ]; then
#     . /opt/local/etc/bash_completion
# fi

# vim: ft=sh:

