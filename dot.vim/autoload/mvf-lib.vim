"
" Last line of a file must be a \n
:function! Add_Last_Line_as_Blank()
:   let s:cur = line(".")
:   let s:pos = line("$")
:   let s:str = getline( s:pos )
:   normal mz
:   if s:str !~ '^$'
:       normal Go
:       normal Gd$
:   endif
"   echo "Line " [s:pos] [s:str] 
:endfunction

"if exists( '*Add_Last_Line_as_Blank' )
"   autocmd BufWritePre   * execute Add_Last_Line_as_Blank()
"   autocmd BufWritePost  * execute normal 'z
"endif

" vim: set ai ft=vim:

