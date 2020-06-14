#!/bin/bash

###
### mvf
### bashrc lib

# Vim {
export EDITOR=vim

# alias  vim='vim  -u /Users/mvferr/work/mv-vim/dot.vimrc --startuptime /tmp/vim.time.1.txt'
# alias gvim='gvim -u /Users/mvferr/work/mv-vim/dot.vimrc --startuptime /tmp/vim.time.1.txt'

# alias  vim20='vim  -u /Users/mvferr/work/vim2020/vimrc'
# alias gvim20='gvim -u /Users/mvferr/work/vim2020/vimrc'

case `uname -s` in
    Darwin)
#       alias   vi='/usr/bin/vim'
#       alias  vim='~/App/MacVim.app/Contents/MacOS/Vim'
        alias tvim='gvim --remote-tab 2>/dev/null'
#       alias gvim='~/App/MacVim.app/Contents/MacOS/Vim -g'
#       alias vimd='~/App/MacVim.app/Contents/MacOS/Vim -g -d'

#       export VIM_APP_DIR=~/App
#       export MANPAGER="col -b | ~/bin/view  -c 'set ft=man nomod nolist' -"
#       export MANPAGER="col -b | ~/bin/mview -c 'set ft=man nomod nolist' -"
        ;;
    *)
        alias vi=vim
#       export MANPAGER="col -b | view  -c 'setspool ft=man nomod nolist' -"
        ;;
esac

# [ -f ~/auth/webco.bfa ] && alias auth='vim ~/auth/webco.bfa'
# }


# vim: ft=sh:

