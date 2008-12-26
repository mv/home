"
" mvf: ferreira.mv[ at ]gmail.com
" -------------------------------

" MacVim Help: hints
" ----------------------------------------------
syntax on
set nocompatible
set mouse=a
set tabpagemax=100
set guifont=Monaco:h12
set nowrap
set viminfo='1000,f1,<500,/50,:50,@50,h,%

" MyColors
" --------
" :colorscheme desert
" :colorscheme elflord
" :colorscheme koehler
" :colorscheme murphy
" :colorscheme pablo
" :colorscheme ron
" :colorscheme slate
colorscheme torte
set bg=dark

" Abbreviations
" -------------
:ab _b        ______________________________________________________________________
:ab _e        ______________________________________________________________________
:ab #b        ______________________________________________________________________
:ab #e        ______________________________________________________________________

" http://weblog.jamisbuck.org/2008/11/17/vim-follow-up
" ----------------------------------------------------
let mapleader = ","
set grepprg=ack
set grepformat=%f:%l:%m

" http://items.sjbach.com/319/configuring-vim-right
" -------------------------------------------------
set history=1000
set hidden
set ignorecase 
set smartcase
set title
set ruler
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set scrolloff=5 " viewpoint
" scroll viewpoint by 'n' lines
nnoremap <C-e> 5<C-e> 
nnoremap <C-y> 5<C-y>

set backspace=indent,eol,start " Intuitive backspacing in insert mode
 
set hlsearch  " Highlight search terms...
set incsearch " ...dynamically as they are typed.
nmap <silent> <leader>n :silent :nohlsearch<CR>

set listchars=tab:>-,trail:·,eol:$ " list invisible spaces
set listchars=tab:>-,trail:·,eol:_
nmap <silent> <leader>s :set nolist!<CR>
" set list/nolist
nmap <C-V><C-V> :set invlist<CR>
" Remove trailing spaces
map <leader>s :%s/\s*$//g

" Line numbers and line number colors
" http://vim.wikia.com/wiki/Display_line_numbers
" ----------------------------------------------
set number
nmap <C-N><C-N> :set invnumber<CR>
set numberwidth=5
set cpoptions+=n
highlight LineNr term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Bash-like filename completion
set wildmenu
set wildmode=list:longest

" FileTypes
" ---------
set tabstop=4
set shiftwidth=4
set noautoindent
set expandtab
set smarttab
set backspace=start,indent

filetype on
filetype plugin on
filetype indent on

autocmd BufRead *.qcf   set filetype=lisp
autocmd BufRead qpx.inc set filetype=make
autocmd BufRead letter* set filetype=mail

autocmd Filetype mail     set fo -=l autoindent spell
autocmd Filetype c,cpp,h  set tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype sh,bash  set ts=4 shiftwidth=4 expandtab autoindent
autocmd Filetype ruby     set ts=2 shiftwidth=2
autocmd Filetype xml,html set ts=8 shiftwidth=8
autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab

" Plugins
" -------

" NerdTree
map <leader>d    :NERDTreeToggle <CR>      " Dir tree
map <leader>tree :NERDTreeToggle <CR>      " Dir tree

" TagList
map <leader>t   :TlistToggle     <CR>
map <leader>tag :TlistToggle     <CR>
map <leader>ts  :TlistSessionSave .proj_vim.tmp<CR>
map <leader>tl  :TlistSessionLoad .proj_vim.tmp<CR>

let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'

" Scratch.vim
map <leader>s  :Scratch  <CR>
map <leader>ss :Sscratch <CR>

" FuzzyFinder
map <leader>c :FuzzyFinderMruCmd    <CR> " Command
map <leader>b :FuzzyFinderBuffer    <CR> " Buffer
map <leader>f :FuzzyFinderFile      <CR> " File
map <leader>r :FuzzyFinderMruFile   <CR> " Recent
map <leader>tm   :FuzzyFinderTextMate  <CR>

map <leader>ffc  :FuzzyFinderMruCmd    <CR> " Command
map <leader>ffcm :FuzzyFinderCmd       <CR> " CoMmand
map <leader>ffb  :FuzzyFinderBuffer    <CR> " Buffer
map <leader>fff  :FuzzyFinderFile      <CR> " File
map <leader>ffr  :FuzzyFinderMruFile   <CR> " Recent
map <leader>ffd  :FuzzyFinderDir       <CR>
map <leader>ffb  :FuzzyFinderBookmark  <CR>
map <leader>fft  :FuzzyFinderTag       <CR>
map <leader>fftf :FuzzyFinderTaggedFile<CR>
map <leader>fftm :FuzzyFinderTextMate  <CR>
   
let g:fuzzy_ignore         = "*.log"
let g:fuzzy_matching_limit = 70

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

