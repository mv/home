" vi/vim: dot.vimrc 
" mvf: ferreira.mv[ at ]gmail.com
" -------------------------------
set nocompatible

" ----------------------------------------------
" MacVim Help: hints
" ----------------------------------------------
syntax on
set cursorline
set nocursorcolumn
set scrolloff=5 " viewpoint
set listchars=tab:>-,trail:·,eol:_,extends:>,precedes:<
set nowrap sidescroll=1 
"set whichwrap=b,s
"set whichwrap+=<,>,[,]

set history=1000
set modeline            " ml: string /* vim:set ... : */
set modelines=10
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize " mksession
set viminfo='1000,f1,<500,/50,:50,@50,h,%

set hidden

set number
set numberwidth=5
set cpoptions-=n
set title
set ruler

" My status line
" --------------
 set laststatus=2
 set statusline =%<buf:[%n]\ %f\ %h%m%r         " buffer, filename, flags
 set statusline+=\ \ ft:[
 set statusline+=%{strlen(&ft)?&ft:'none'}      " filetype
"set statusline+=,%{&encoding}                  " encoding
"set statusline+=,%{&fileformat}                " file format
 set statusline+=]\ "
 set statusline+=%=                             " break
"set statusline+=asc:[%3.(%b%)\ %4.(0x%B%)]     " current char
 set statusline+=%(tag:[%{Tlist_Get_Tagname_By_Line()}]%)
"set statusline+=\ col/lin:[%3.(%c%)\ %-7.(%l/%L%)]\ %P
 set statusline+=\ [%3.(%c%)\ %-7.(%l/%L%)]\ %P
 if filereadable(expand("~/.vim/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
 endif

set showcmd
set wildmenu            " Bash-like filename completion in command line
set wildmode=list:longest
set wildignore+=*.o,*~,.lo

set splitbelow          " sb: new split below current window
set splitright          " spr: new split to the right

set grepprg=ack
set grepformat=%f:%l:%m

set ignorecase
set smartcase
set showmatch
set hlsearch  " Highlight search terms...
set incsearch " ...dynamically as they are typed.

set autoindent      " ai: pre-req for si
set smartindent     " si: on
set backspace=start,indent,eol

set tabstop=8       " ts
set softtabstop=4   " sts: space in place of tabs
set expandtab       " et: space in place of tabs
set shiftwidth=4    " sw: nr of spaces for autoindent
set smarttab        " sta: space in place of tabs in a new line

" ---------
" FileTypes
" ---------
filetype on
filetype plugin on
filetype indent on

 autocmd BufRead *.qcf   set filetype=lisp
 autocmd BufRead qpx.inc set filetype=make
 autocmd BufRead letter* set filetype=mail

 autocmd BufNewFile,BufRead *.notes     set filetype=notes
 autocmd BufNewFile,BufRead *.notes.txt set filetype=notes

 autocmd Filetype mail     set fo-=l autoindent spell
 autocmd FileType make     set noet nosta
"autocmd Filetype ruby     set sts=2 sw=2
"autocmd Filetype c,cpp,h  colorscheme slate
"autocmd Filetype bash,sh  colorscheme murphy
"
 autocmd BufReadPost  *.log      normal G
"autocmd BufWritePost ~/Work/mv_home/dot.vimrc   so ~/.vimrc

"
" git.git/contrib
 autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

" -------------------------------------------------
"  key configuration 
" -------------------------------------------------

" http://items.sjbach.com/319/configuring-vim-right
" scroll viewpoint by 'n' lines
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

let mapleader=","
nmap <leader>q  :q <CR>
nmap <leader>q1 :q!<CR>
nmap <leader>w  :w <CR>
nmap <leader>wa :wa<CR>
nmap <leader>ls :ls <CR>
nmap <leader>n  :set invhls<CR>
command! W w
command! Q q
command! Myvimrc    tabnew ~/.vimrc
command! Rehash     source ~/.vimrc
command! Helptags   helptags ~/.vim/doc
command! Color      echo g:colors_name
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-V><C-V> :set invlist  <CR> " set list/nolist
nmap <C-L><C-L> :set invcuc   <CR> " set cursorcolumn/nocursorcolumn
nmap <C-S><C-S> :%s/\s*$//g   <CR> | set nohlsearch " Remove trailing spaces
nmap <C-D><C-D> :%s/\r$//g    <CR> " dos2unix
" home/end in a line
map H ^
map L $
" moving buffers/windows
nmap <leader>bj :bnext<CR>
nmap <leader>bk :bprev<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bf :FuzzyFinderBuffer<CR> " Buffer
nmap <leader>wj <C-W>j
nmap <leader>wk <C-W>k
nmap <leader>wh <C-W>h
nmap <leader>wl <C-W>l

" Abbreviations
" -------------
" ab _b        ______________________________________________________________________
" ab #b        ######################################################################
" ab _c        # ______________________________________________________________________
" ab #c        # ######################################################################

" Terminal vim theme
" ------------------
colorscheme desert
set bg=dark

" MyLib
" -----
source ~/.vim/autoload/mvf-lib.vim
map <leader>l :call Add_Last_Line_as_Blank() <CR>

" vim: ft=vim:

