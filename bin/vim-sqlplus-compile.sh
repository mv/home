#!/bin/bash
#
# Vim wrapper
#     http://michelhollands.net/blog/2004/08/24/compiling-plsql-within-vim-2/#comment-135
#
# ~/.vimrc:
#     autocmd BufRead *sql set makeprg=~/bin/sql_compile_vim.sh\ %\ "g:ora_connect"
#     autocmd BufRead *sql set efm=%E%l/%c%m,%C%m,%Z
#

cat <<CAT

Params:
    1: $1
    2: $2
CAT
# exit 99

source ~/bin/oracle.rc.sh

[ -z "$2" ] && connect=$( cat ~/config/ora_connect.txt ) || connect="$2"

$ORACLE_HOME/bin/sqlplus -l -s "$connect" <<SQL

   @ "$1"

   show errors
   exit
   
SQL

exit 0

