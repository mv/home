#!/bin/bash

###
### mvf
### bashrc lib

# MacOS X {

[ `uname -s` != "Darwin" ] && return

alias sleep_ram='sudo pmset -a hibernatemode 0'
alias sleep_hdd='sudo pmset -a hibernatemode 1'
alias sleep_combined='sudo pmset -a hibernatemode 3'

alias rmdst='find . -type f -name .DS_Store | xargs rm -f'

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

# vim: ft=sh:

