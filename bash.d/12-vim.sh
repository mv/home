#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

if _cmd_exists nvim
then
    _bashrc_verbose "== Vim: NeoVim"
    alias vi=nvim
    export EDITOR=nvim
elif _cmd_exists vim
then
    _bashrc_verbose "== Vim"
    alias vi=vim
    export EDITOR=vim
else _bashrc_verbose "== Vim: NOT FOUND"
fi

# Vim {

# alias  vim='vim  -u /Users/mvferr/work/mv-vim/dot.vimrc --startuptime /tmp/vim.time.1.txt'
# alias gvim='gvim -u /Users/mvferr/work/mv-vim/dot.vimrc --startuptime /tmp/vim.time.1.txt'

# alias  vim20='vim  -u /Users/mvferr/work/vim2020/vimrc'
# alias gvim20='gvim -u /Users/mvferr/work/vim2020/vimrc'

# case `uname -s` in
#   Darwin)
#       alias   vi='/usr/bin/vim'
#       alias  vim='~/App/MacVim.app/Contents/MacOS/Vim'
#       alias tvim='gvim --remote-tab 2>/dev/null'
#       alias gvim='~/App/MacVim.app/Contents/MacOS/Vim -g'
#       alias vimd='~/App/MacVim.app/Contents/MacOS/Vim -g -d'
#
#       export VIM_APP_DIR=~/App
#       export MANPAGER="col -b | ~/bin/view  -c 'set ft=man nomod nolist' -"
#       export MANPAGER="col -b | ~/bin/mview -c 'set ft=man nomod nolist' -"
#         ;;
#   *)
#       alias vi=vim
#       export MANPAGER="col -b | view  -c 'setspool ft=man nomod nolist' -"
#       ;;
# esac
# }

#
# Neovim
#   :echo stdpath('config')
#
# vim-plug
#   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#
# Neovim: init.vim
# call plug#begin(stdpath('data') . '/plugged')
#   Plug 'tpope/vim-surround'
#   Plug 'tpope/vim-repeat'
#
#   Plug 'tpope/vim-unimpaired'
#   Plug 'tpope/vim-characterize'
#
#   Plug 'tpope/vim-commentary'
# call plug#end()
#