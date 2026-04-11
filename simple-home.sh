###
### Simple version
###

#
# To run:
#   curl -s https://github.com/mv/home/simple-home.sh | sudo bash -x
#

_os_release=$( awk -F= '/^ID=/ {print $2}' /etc/os-release )

case ${_os_release} in
  fedora|rhel|centos|alma|rocky)
      _vimrc="/etc/vimrc.local"
    _aliases="/etc/profile.d/aliases.sh"
  ;;
  ubuntu|alpine)
      _vimrc="/etc/vim/vimrc.local"
    _aliases="/etc/profile.d/aliases.sh"
  ;;
  *)
      _vimrc="/etc/vimrc.local"
    _aliases="/etc/profile.d/aliases.sh"
  ;;
esac

cat > ${_vimrc} <<EOF
"
" vim:ft=vimrc:
"

colorscheme slate

" Viewport
" ========
set nu
set numberwidth=5       " linenumber width
set nolist              " list/listchars: invisible chars
set listchars=tab:>\ ,trail:.,eol:_,extends:>,precedes:<
set cursorline
set cursorcolumn
set scrolloff=3         " keep 3 lines scrolling up/down
set sidescroll=0        " keep 'n' columns scrolling left/right
set sidescrolloff=0     " keep 'n' columns scrolling left/right

set showmatch           " show matching brackets
set matchtime=5         " ms blinking showmatch

set incsearch           " Highlight dynamically as they are typed.
set nohlsearch          " Highlight search terms: disable on start

set ignorecase          " search: ignore case
set smartcase           " auto override ignorecase if search contains upper case
set tagcase=followscs   " follow smartcasbegin of word

set nowrapscan	    " turn off search wrapping

" Keys
" ====
let mapleader=","
nnoremap <leader>nu  :set invnumber<CR> " linenumber on/off
nnoremap <leader>rnu :set invrnu   <CR> " relativenumber on/off
nnoremap <leader>cuc :set invcuc   <CR> " set cursorcolumn/nocursorcolumn
nnoremap <leader>l   :set invlist  <CR> " invisibles List on/off
nnoremap <leader>w   :write! <CR>
nnoremap <leader>q   :quit!  <CR>

" K = inverted J: join current line to the one below
nnoremap K ddpkJ

" Y = Quick yanking to the end of the line
nnoremap Y y$

" row up/down if wrap active
nnoremap j gj
nnoremap k gk


" Windows
" =======

set equalalways         " ea: resize all windows to same size to fit a new one
set splitbelow          " sb: split new window below current window
set splitright          " spr: split new window to the right

nmap <leader>vsp  :vsplit<CR>
nmap <leader>sp   :split<CR>
nmap <leader>spt  :tab split<CR>

"""
""" Navigating:
"""   cursor to next window
"""
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h

EOF

cat > ${_aliases} <<EOF
#
# vim:ft=sh:
#
export PS1="\e[01;33m\u\e[01;37m@\e[01;36m\h\e[01;37m:\e[00;33m\w\e[0m\n\$ "

# mvf: for some time....
alias ls='ls -hAF --color=auto --time-style=long-iso'
alias ll='ls -l'
alias lr='ls -lhtr'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias grep='grep --color'

alias df='df -h'
alias env='env | sort'
alias envg='env | sort | grep -i'

alias netl='netstat -anlp | grep -i listen | grep -i tcp'
alias netg='netstat -anlp | grep -i'

alias  psg='ps -ef | grep -v grep | grep -i'

alias rpmi='rpm -qi'
alias rpmc='rpm -qa | wc -l'
alias rpml='rpm -qa | sort'
alias rpmg='rpm -qa | sort | grep -i'

alias yuml='yum list '
alias yumg='yum list | grep -i'

alias dnfl='dnf list '
alias dnfg='dnf list | grep -i'

alias syslog="tail -f /var/log/messages"

# vim:ts=4:sw=4


EOF

chmod 775 /etc/profile.d/aliases.sh

# clear other 'alias ls'
[ -e /etc/profile.d/colorls.sh ] && /bin/sed -i -e 's/^\s*alias/# alias/' /etc/profile.d/colorls.sh
