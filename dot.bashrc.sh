###
### mvf
### macos:/etc/bashrc

# Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#   \[\e[01;36m\]
export PS1='\[\e]0;\w\a\]\n\[\e[01;33m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[00;33m\]\w \[\e[0m\]\n\$ '

# System-wide .bashrc file

# Interactive operation...
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

alias less='less -r'                          # raw control characters
alias grep='egrep --color'                    # show differences in colour

alias  ls='ls -hAFG'
alias  ls='gls -hF --color'
alias   l='ls'
alias  ll='ls -l'                              # long list
alias  lr='ls -ltr'                            # long list
alias  la='ls -A'                              # all but . and ..
alias lla='ls -A'                              # all but . and ..

alias rehash='source ~/.bashrc'

# dir/files
alias      ..="\cd .. ; ls"
alias    cd..="\cd .. ; ls"
function mkcd  {  
    mkdir -p "$1" && cd "$1"
}
alias  findmod='find .         -exec chmod g+w,o-w {} \;'
alias findmodd='find . -type d -exec chmod 775 {} \;'
alias findmodf='find . -type f -exec chmod 664 {} \;'

# net
alias sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 '
alias netr='netstat -rn -f inet'
alias neta='netstat -an -f inet'
alias netl='netstat -an -f inet | grep -i listen'
alias ifcfl='ifconfig en0 ; ifconfig en1'
alias ifcfa='ifconfig -a'

# processes
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
alias svnpset='svn propset svn:keywords "Id URL Rev Author Date"'
alias svkpset='svk propset svn:keywords "Id URL Rev Author Date"'

alias  gb='git branch'
alias gba='git branch -a'
alias  gc='git commit -v'
alias  gl='git pull'
alias  gp='git push'
alias gst='git status'
alias  gd='git diff | vim -'

alias github='git push git@github.com:mv/home.git'
[ -f ~/bin/git-completion.sh ] && source ~/bin/git-completion.sh ]

# Security
alias auth='vim ~/.auth.bfa'

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

export PATH LD_LIBRARY_PATH MANPATH

export MANPAGER="col -b | view -c 'set ft=man nomod nolist' -"

export VIM_APP_DIR=/Applications/Desenv
export EDITOR=vim
alias  vim='~/App/MacVim.app/Contents/MacOS/Vim '
alias mvim='~/App/MacVim.app/Contents/MacOS/Vim --remote-tab'
alias gvim='~/App/MacVim.app/Contents/MacOS/Vim -g'

