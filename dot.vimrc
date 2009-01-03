"
" mvf: ferreira.mv[ at ]gmail.com
" -------------------------------
set nocompatible

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

set number
set numberwidth=5
set cpoptions-=n
set title
set ruler
set laststatus=2
set statusline =%<buf:[%n]\ %f\ %h%m%r          " buffer, filename, flags
set statusline+=\ \ [
set statusline+=%{strlen(&ft)?&ft:'none'}       " filetype
"set statusline+=,%{&encoding}                  " encoding
"set statusline+=,%{&fileformat}                " file format
set statusline+=]\ "
set statusline+=%=asc:[%3.(%b%)\ %4.(0x%B%)]    " current char
set statusline+=\ col/line:[%3.(%c%)\ %-7.(%l/%L%)]\ %P
if filereadable(expand("~/.vim/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif

set showcmd
set wildmenu            " Bash-like filename completion in command line
set wildmode=list:longest
set wildignore+=*.o,*~,.lo

set guifont=Monaco:h12
set mouse=a
set mousehide
set tabpagemax=100      " tpm: max nro of tab windows
set gtl=%t gtt=%F       " snapshot40

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

" FileTypes
" ---------
filetype on
filetype plugin on
filetype indent on

autocmd BufRead *.qcf   set filetype=lisp
autocmd BufRead qpx.inc set filetype=make
autocmd BufRead letter* set filetype=mail

autocmd Filetype mail     set fo-=l autoindent spell
autocmd FileType make     set noet nosta
" autocmd Filetype ruby     set sts=2 sw=2
" autocmd Filetype c,cpp,h  colorscheme slate
" autocmd Filetype bash,sh  colorscheme murphy
"
autocmd BufReadPost  *.log      normal G
"autocmd BufWritePost ~/Work/mv_home/dot.vimrc   so ~/.vimrc

"
" git.git/contrib
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

" http://items.sjbach.com/319/configuring-vim-right
" -------------------------------------------------
" scroll viewpoint by 'n' lines
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

let mapleader=","
nmap <leader>q  :q <CR>
nmap <leader>w  :w <CR>
nmap <leader>ls :ls <CR>
nmap <leader>n  :set invhls<CR>
command! W w
command! Q q
command! Rehash     source ~/.vimrc
command! Color      echo g:colors_name
command! Helptags   helptags ~/.vim/doc
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

" Plugins
" -------

" NerdTree
map <leader>d :NERDTreeToggle <CR> " Dir tree
let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode         = 2
let NERDTreeIgnore            = ['\.[ao]$','\.swp$','\.DS_Store','\.svn','\.CVS','\.git']
let NERDTreeMouseMode         = 2
let NERDTreeShowLineNumbers   = 0
let NERDTreeWinSize           = 35

" FuzzyFinder
let g:fuzzy_ignore         = "*.log"
let g:fuzzy_matching_limit = 70
map <leader>tm   :FuzzyFinderTextMate  <CR>
map <leader>ffb  :FuzzyFinderBuffer    <CR> " Buffer
map <leader>fff  :FuzzyFinderFile      <CR> " File
map <leader>ffmf :FuzzyFinderMruFile   <CR> " Recent
map <leader>ffc  :FuzzyFinderCmd       <CR> " CoMmand
map <leader>ffmc :FuzzyFinderMruCmd    <CR> " Command
map <leader>ffd  :FuzzyFinderDir       <CR>
map <leader>ffbm :FuzzyFinderBookmark  <CR>
map <leader>fft  :FuzzyFinderTag       <CR>
map <leader>fftf :FuzzyFinderTaggedFile<CR>

" TagList
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
map <leader>t   :TlistToggle     <CR>
map <leader>ts  :TlistSessionSave ~/.tlistsession.vim.tag <CR>
map <leader>tl  :TlistSessionLoad ~/.tlistsession.vim.tag <CR>
" set showfulltag

" bash-support
let g:BASH_AuthorName   = 'Marcus Vinicius Ferreira'
let g:BASH_AuthorRef    = 'mvf'
let g:BASH_Email        = 'ferreira.mv[ at ]gmail.com'
let g:BASH_Company      = 'Webco Internet'
let g:BASH_FormatDate   = '%b/%Y'
let g:BASH_FormatTime   = '%R'
let g:BASH_DoOnNewLine  = 'yes'
let g:BASH_LineEndCommColDefault = 49

" perl-support
" http://www.perlmonks.org/?node_id=540393
" http://www.perlmonks.org/?node_id=540167
let g:Perl_FormatDate   = '%b/%Y'
let g:Perl_FormatTime   = '%R'
let g:Perl_LineEndCommColDefault  = 49

" rails
" http://www.vim.org/scripts/script.php?script_id=1567
" http://wiki.rubyonrails.org/rails/pages/HowtoUseVimWithRails

" ruby complete
" http://vim-ruby.rubyforge.org/
" http://hasno.info/2006/04/10/vim-7-ruby-omni-completion
" -------------------------------------------------------
" enable rubycomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" if you want buffer/rails/global completion you must add the following:
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" if you want rails support add the following in addition
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" if you want classes included in global completions add the following
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Scratch.vim
function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction
map <leader>s :call ToggleScratch()<CR>

" openssl (password safe)
" ms: 15000 - 15s
"     30000 - 20s
"    300000 -  5m
let g:openssl_timeout = 15000

" Abbreviations
" -------------
ab _b        ______________________________________________________________________
ab -b        ----------------------------------------------------------------------
ab #b        ######################################################################
ab _c        # ______________________________________________________________________
ab -c        # ----------------------------------------------------------------------
ab #c        # ######################################################################

" MyColors
" --------
"map <leader>4 :colorscheme elflord  <CR>
"map <leader>5 :colorscheme koehler  <CR>
"map <leader>6 :colorscheme slate    <CR>
"map <leader>7 :colorscheme murphy   <CR>
"map <leader>8 :colorscheme pablo    <CR>
"map <leader>9 :colorscheme ron      <CR>
map <leader>1 :colorscheme ir_black2<CR>
map <leader>2 :colorscheme ir_black <CR>
map <leader>3 :colorscheme torte    <CR>
map <leader>4 :colorscheme desert   <CR>

map <leader>9 :highlight Folded guibg=blue guifg=white <CR>
map <leader>0 :echo g:colors_name   <CR>
colorscheme ir_black2
set bg=dark

" MyLib
" -----
source ~/.vim/autoload/mvf-lib.vim
map <leader>l :call Add_Last_Line_as_Blank() <CR>

" http://vim.wikia.com/wiki/Using_marks
" ma        set mark '''a''' at current cursor location
" 'a        jump to line of mark a (beginning of line)
" `a        jump to position of mark a
" d'a       delete from current line to line of mark a
" d`a       delete from current cursor position to position of mark a
" c'a       change text from current line to line of mark a
" y`a       yank text to unnamed buffer from cursor to position of mark a
" ''        jump back (to line where jumped from)
" `0        jump to position in last file edited (when exited Vim)
" ``        jump back (to position where jumped from)
" :marks    list all the current marks
"
" vim: ft=vim:

