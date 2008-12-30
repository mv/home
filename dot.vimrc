"
" mvf: ferreira.mv[ at ]gmail.com
" -------------------------------
set nocompatible

" MacVim Help: hints
" ----------------------------------------------
syntax on
set cursorline
set nocursorcolumn
set nowrap sidescroll=1 
set scrolloff=5 " viewpoint
set listchars=tab:>-,trail:·,eol:_,extends:>,precedes:<
set title
set ruler

set history=1000
set viminfo='1000,f1,<500,/50,:50,@50,h,%
set modeline            " ml: string /* vim:set ... : */
set modelines=10
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize
set wildmenu            " Bash-like filename completion in command line
set wildmode=list:longest

colorscheme torte
set bg=dark
set guifont=Monaco:h12
set mouse=a
set tabpagemax=100      " tpm: max nro of tab windows
set gtl=%t gtt=%F       " snapshot40

set grepprg=ack
set grepformat=%f:%l:%m

set ignorecase
set smartcase
set hlsearch  " Highlight search terms...
set incsearch " ...dynamically as they are typed.
map <silent> <leader>n :silent :nohlsearch<CR> " turn off hlsearch

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
autocmd Filetype ruby     set sts=2 sw=2
autocmd FileType make     set noet nosta
autocmd FileType python   set noet nosta
" autocmd Filetype c,cpp,h  colorscheme slate
" autocmd Filetype bash,sh  colorscheme murphy
"
autocmd BufReadPost  *.log      normal G
autocmd BufWritePost ~/Work/mv_home/dot.vimrc   so ~/.vimrc
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
command! W w
command! Q q
command! Rehash     source ~/.vimrc
command! Color      echo g:colors_name
command! Helptags   helptags ~/.vim/doc

" Line numbers and line number colors
" http://vim.wikia.com/wiki/Display_line_numbers
" ----------------------------------------------
set number
set numberwidth=5
set cpoptions-=n
highlight LineNr term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-V><C-V> :set invlist  <CR> " set list/nolist
nmap <C-L><C-L> :set invcuc   <CR> " set cursorcolumn/nocursorcolumn
nmap <C-S><C-S> :%s/\s*$//g   <CR> " Remove trailing spaces
nmap <C-D><C-D> :%s/\r$//g    <CR> " dos2unix

" Plugins
" -------

" NerdTree
map <leader>d :NERDTreeToggle <CR>      " Dir tree
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

" ruby
" http://vim-ruby.rubyforge.org/

" Scratch.vim
" map <leader>Ss :Scratch  <CR>
" map <leader>SS :Sscratch <CR>

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
map <leader>1 :colorscheme desert   <CR>
map <leader>2 :colorscheme elflord  <CR>
map <leader>3 :colorscheme koehler  <CR>
map <leader>4 :colorscheme murphy   <CR>
map <leader>5 :colorscheme pablo    <CR>
map <leader>6 :colorscheme ron      <CR>
map <leader>7 :colorscheme slate    <CR>
map <leader>9 :colorscheme torte    <CR>
map <leader>0 :echo g:colors_name   <CR>

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
" vim: set ft=vim:

