" gvim: dot.gvimrc
" mvf: ferreira.mv[ at ]gmail.com
" -------------------------------

" GVIM theme
" ------------------
set guifont=Monaco:h12
set mouse=a
set mousehide
set tabpagemax=100      " tpm: max nro of tab windows
set gtl=%t gtt=%F       " snapshot40

set invcuc              " vertical cursorline

" MyColors
" --------
"map <leader>4 :colorscheme elflord  <CR>
"map <leader>5 :colorscheme koehler  <CR>
"map <leader>6 :colorscheme slate    <CR>
"map <leader>7 :colorscheme murphy   <CR>
"map <leader>8 :colorscheme pablo    <CR>
"map <leader>9 :colorscheme ron      <CR>

colorscheme ir_black3
set bg=dark

map <leader>1 :colorscheme ir_black3<CR>
map <leader>2 :colorscheme ir_black2<CR>
map <leader>3 :colorscheme ir_black <CR>

map <leader>7 :colorscheme torte    <CR>
map <leader>8 :colorscheme desert   <CR>

map <leader>9 :highlight Folded guibg=blue guifg=white <CR>
map <leader>0 :echo g:colors_name   <CR>

" -------
" Plugins
" -------

" """"""""""
" NerdTree
" """"""""""
map <leader>d  :NERDTreeToggle <CR> " Dir tree
map <leader>dd :NERDTreeMirror <CR> " Dir tree
let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode         = 2
let NERDTreeIgnore            = ['\.[ao]$','\.swp$','\.DS_Store','\.svn','\.CVS','\.git']
let NERDTreeMouseMode         = 2
let NERDTreeShowLineNumbers   = 0
let NERDTreeWinSize           = 35

" """"""""""""
" FuzzyFinder
" """"""""""""
let g:fuzzy_ignore         = "*.log"
let g:fuzzy_matching_limit = 70
let g:fuzzy_ceiling = 95000
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

" """"""""
" autocomplpop : autocomplete
" """"""""
let g:AutoComplPop_NotEnableAtStartup    = 0
let g:AutoComplPop_MappingDriven         = 1 
let g:AutoComplPop_BehaviorKeywordLength = 2
map <leader>lac :AutoComplPopEnable <CR>
map <leader>uac :AutoComplPopDisable <CR>

" """"""""
" bufexplorer
" """"""""
" ,be / ,bv / ,bs
let g:bufExplorerReverseSort  = 0
let g:bufExplorerShowUnlisted = 1
let g:bufExplorerSortBy       ='name'

" """"""""
" calendar
" """"""""
" ,ca / ,ch / :Calendar / :CalendarH
let g:calendar_focus_today = 1
let g:calendar_weeknm = 2

" """""""""""""
" bash-support
" """""""""""""
" ,lbs / ,ubs
let g:BASH_AuthorName   = 'Marcus Vinicius Ferreira'
let g:BASH_AuthorRef    = 'mvf'
let g:BASH_Email        = 'ferreira.mv[ at ]gmail.com'
let g:BASH_Company      = 'Webco Internet'
let g:BASH_FormatDate   = '%b/%Y'
let g:BASH_FormatTime   = '%R'
let g:BASH_DoOnNewLine  = 'yes'
let g:BASH_LineEndCommColDefault = 49

" """""""""""""
" perl-support
" """""""""""""
" http://www.perlmonks.org/?node_id=540393
" http://www.perlmonks.org/?node_id=540167
" ,lps / ,ups
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

" """"""""""""
" Scratch.vim
" """"""""""""
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
let g:openssl_timeout = 301000

" """"""""
" readcsv
" """"""""
autocmd BufNewFile,Bufread *.csv call CSVSELECT()
map <leader>c1 :call CSV_HighlightPrevCol()<CR> 
map <leader>c2 :call CSV_HighlightNextCol()<CR> 
map <leader>c3 :call CSV_goto_field()      <CR>
map <leader>c4 :call CSV_SE()              <CR>

" """"""""
" taglist
" """"""""
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
map <leader>t   :TlistToggle     <CR>
map <leader>ts  :TlistSessionSave ~/.tlistsession.vim.tag <CR>
map <leader>tl  :TlistSessionLoad ~/.tlistsession.vim.tag <CR>

" vim: ft=vim:

