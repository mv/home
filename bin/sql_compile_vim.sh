#!/bin/bash
#
# Vim wrapper
#     http://michelhollands.net/blog/2004/08/24/compiling-plsql-within-vim-2/#comment-135
#
# ~/.vimrc:
#     autocmd BufRead *sql set makeprg=~/bin/sql_compile_vim.sh\ %\ "g:ora_connect"
#     autocmd BufRead *sql set efm=%E%l/%c%m,%C%m,%Z
#

export DYLD_LIBRARY_PATH=/u01/app/oracle/product/10.2.0.4/db_1/lib
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH

# echo "1: $1" ;echo "2: $2" ;exit 99

[ -z "$2" ] && connect=$( cat ~/config/ora_connect.txt ) || connect="$2"

sqlplus -s "$connect" <<SQL

   @ "$1"

   show errors
   exit
   
SQL

exit 0
