#!/bin/bash

###
### mvf
### macos:~/.bashrc

# *PATH {
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

PATH=/opt/local/bin
pathadd /opt/local/sbin             after
pathadd /opt/local/lib/mysql5/bin   after
pathadd /usr/local/bin              after
pathadd /usr/local/sbin             after
pathadd /Developer/usr/bin          after
pathadd /Developer/usr/sbin         after
pathadd /bin                        after
pathadd /sbin                       after
pathadd /usr/bin                    after
pathadd /usr/sbin                   after
pathadd /usr/X11/bin                after

LD_LIBRARY_PATH=/opt/local/lib
ldpathadd /usr/local/apache/lib         after
ldpathadd /usr/local/BerkeleyDB.4.6/lib after
ldpathadd /usr/local/lib                after

MANPATH=/opt/local/share/man
manpathadd /usr/local/share/man         after
manpathadd /Developer/usr/share/man     after
manpathadd /usr/share/man               after

export PATH LD_LIBRARY_PATH MANPATH
# }

# Volumes {
alias df='df -h'
alias du='du -h'

if which column > /dev/null
then
    alias mount='mount | column -t'
fi
# }

# ls {
case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias ls='ls -AFhG'
        ;;
    Linux)
        alias ls='ls -AFh --color=auto --time-style=long-iso --group-directories-first'
        # bright colors: http://www.walkernews.net/2007/03/29/brighten-linux-ls-command-output-with-ls_colors/
        # eval `echo $LS_COLORS | sed 's/00;/01;/g' | awk '{print "export LS_COLORS=\""$0"\""}' `
        ;;
    *)
        alias ls='ls -AF'
        ;;
esac

[ `which gls 2>/dev/null` ] && alias ls='gls -AFh --color=auto --time-style=long-iso --group-directories-first'

alias ll='ls -l'                       # long list
alias lr='ls -ltr'                     # long list
alias la='ls -A'                       # all but . and ..
alias  l='/bin/ls'
export LS_COLORS='*sql=33:*log=93:*buf=31'
# }

# Dir/files {
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

function cd  {
    builtin cd "$@" && ls
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

alias env='env | sort'
alias     path='IFS=: && echo path     ; for f in $PATH             ; do echo "    $f"; done'
alias   ldpath='IFS=: && echo ldpath   ; for f in $LD_LIBRARY_PATH  ; do echo "    $f"; done'
alias dyldpath='IFS=: && echo dyldpath ; for f in $DYLD_LIBRARY_PATH; do echo "    $f"; done'
alias  manpath='IFS=: && echo manpath  ; for f in $MANPATH          ; do echo "    $f"; done'
# }

# Net & processes {
    # http://serverfault.com/questions/15365/favorite-unix-command-line-aliases
    alias memusage='ps -o rss,command -waxc | sort -n'
    alias rdt='rdesktop -d UOFA -g 1024x768 -u '
    alias csort='sort | uniq -c | sort -n' # column sort/count

case `uname -s` in
    Darwin | FreeBSD | OpenBSD)
        alias   netr='netstat -rn -f inet'
        alias   neta='netstat -an -f inet'
        alias   netl='netstat -an -f inet | grep -i listen'
        alias   ifcf='ifconfig en0 ; ifconfig en1'

        alias    top='top -ocpu -Otime -X'         # MacOS: order by cpu and then time, old display format
        alias    msg='tail -f /var/log/system.log' # MacOS

        alias sleep_ram='sudo pmset -a hibernatemode 0'
        alias sleep_hdd='sudo pmset -a hibernatemode 1'
        alias sleep_combined='sudo pmset -a hibernatemode 3'
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
alias   nmap='sudo nmap -v -A'
alias  nmap0='sudo nmap -v -A -P0'

which rlwrap > /dev/null && alias nslookup='rlwrap nslookup'

function ifconfig {
    if [ "$1" ]
    then /sbin/ifconfig $1
    else /sbin/ifconfig -a
    fi
}

function psg {
    if [ "$1" ]
    then ps -ef | \grep -v grep | grep "$1"
    else ps -ef | more
    fi
}

# }

# Version control {
[ `which svn 2> /dev/null` ] && alias    pset='svn propset svn:keywords "Id URL Rev Author Date"'
[ `which svk 2> /dev/null` ] && alias svkpset='svk propset svn:keywords "Id URL Rev Author Date"'

if which git > /dev/null
then
    alias  gb='git branch'
    alias gba='git branch -a -v'
    alias  gc='git commit -v'
    alias gpp='git pull && git push'
    alias gpl='git pull'
    alias gps='git push'
    alias  gp='git push'
    alias gst='git status'
    alias  gd='git diff | vim -'

    alias gitk='gitk --all &'
    alias gitclean='git remote prune origin && git remote update'

function git-add() {
    [ -z "$1" ] && return
    set -x
    git add "$1"
    git commit -m 'Added.'
    git push
    set +x
}

function git-new-branch() {
    [ -z "$1" ] && return
    set -x
    git push origin origin:refs/heads/$1
    git checkout --track -b $1 origin/$1
    set +x
}

function git-rm-branch() {
    [ -z "$1" ] && return
    set -x
    git checkout master
    git branch -d           $1
    git branch -d -r origin/$1
    set +x
}

fi
# }

# Devel {

function tags() {
    if [ -z "$1" ]
    then ctags --verbose --recurse
    else ctags --verbose --recurse --languages=$1
    fi
}

# }

# Others {
alias dtfile='date "+%Y-%m-%d_%H%M"'
alias  dtiso='date "+%Y-%m-%d %X"'
alias  dtdns='date "+%Y%m%d%H%M%S"'

alias   less='less -r'                    # raw control characters
alias   grep='egrep --color'              # show differences in colour
# }

# Vim {
export EDITOR=vim

case `uname -s` in
    Darwin)
        alias   vi='/usr/bin/vim'
        alias  vim='~/App/MacVim.app/Contents/MacOS/Vim'
        alias gvim='~/App/MacVim.app/Contents/MacOS/Vim -g'
        alias tvim='~/App/MacVim.app/Contents/MacOS/Vim --remote-tab'
        alias vimd='~/App/MacVim.app/Contents/MacOS/Vim -g -d'

        export VIM_APP_DIR=~/App
        export MANPAGER="col -b | ~/bin/view  -c 'set ft=man nomod nolist' -"
        export MANPAGER="col -b | ~/bin/mview -c 'set ft=man nomod nolist' -"
        ;;
    *)
        alias vi=vim
        export MANPAGER="col -b | view  -c 'setspool ft=man nomod nolist' -"
        ;;
esac

[ -f ~/auth/webco.bfa ] && alias auth='vim ~/auth/webco.bfa'
# }

# Bash Options {
#hopt -s ignoreeof        # ignore CTRL-D at prompt
shopt -s  cdspell         # corrects dir names

export CDPATH=.:~:/work:/work/mvdba:/work/webcointernet:/public
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'
export HISTCONTROL='ignoredups:erasedups'

function hcount {
    [ "$1" ] && _line=$1 || _line=10
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -${_line}
}

alias rehash='source ~/.bashrc'
set -o vi

# }

# Externals {
  [ -f /opt/local/etc/bash_completion          ] && source /opt/local/etc/bash_completion
  [ -f /opt/local/etc/profile.d/cdargs-bash.sh ] && source /opt/local/etc/profile.d/cdargs-bash.sh

# [ -f ~/bin/git-completion.sh        ] && source ~/bin/git-completion.sh
  [ -f ~/bin/oracle.rc.sh             ] && source ~/bin/oracle.rc.sh
# }

# MacOS Tab Name {
function set_window_and_tab_title {
    local title="$1"
    if [[ -z "$title" ]]; then
        title="root"
    fi

    local tmpdir=/tmp/cache/${FUNCNAME}_temp
    local cmdfile="$tmpdir/$title"

    # Set window title
    echo -n -e "\e]0;${title}\a"

    # Set tab title
    if [[ -n ${CURRENT_TAB_TITLE_PID:+1} ]]; then
        kill $CURRENT_TAB_TITLE_PID
    fi
    mkdir -p $tmpdir
    ln /bin/sleep "$cmdfile"
    "$cmdfile" 10 &
    CURRENT_TAB_TITLE_PID=$(jobs -x echo %+)
    disown %+
    kill -STOP $CURRENT_TAB_TITLE_PID
    command rm -f "$cmdfile"
}

PROMPT_COMMAND='set_window_and_tab_title "${PWD##*/}"'

# }

# Prompt {
# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#   \[\e[01;36m\]

# export yellow="\[\e[01;33m\]"
# export  white="\[\e[01;37m\]"
# export   cyan="\[\e[01;36m\]"
# export    red="\[\e[01;31m\]"
# export orange="\[\e[00;33m\]"
# export  reset="\[\e[0m\]"
#            r1='\[\e]0;\w\a\]\n'
# prompt="${yellow}\u${white}@${cyan}\h${white}:${orange}\w${reset}"

export PS1='\u@\h:\w\n\$ '
  type __git_ps1 2>/dev/null 1>/dev/null && export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)")\n\$ '
  type __ora_ps1 2>/dev/null 1>/dev/null && export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '

  type __git_ps1 2>/dev/null 1>/dev/null && \
  type __ora_ps1 2>/dev/null 1>/dev/null && export PS1='\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w\[\e[0m\] $(__git_ps1 "(%s)") \[\e[01;31m\]$(__ora_ps1)\[\e[0m\]\n\$ '
export PS1
# }

# ABD {
alias sshroot='ssh -p 5022 -l root '
# }

umask 002

# vim: ft=sh foldlevel=0:

