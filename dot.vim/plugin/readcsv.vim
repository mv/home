"This idea comes from network, I just make this easy to use, 
"and I copy some code from other people. Thanks.
"Gao Hongli @2007/12
"usage: add below line into your .vimrc
autocmd BufNewFile,Bufread *.csv call CSVSELECT()
map <leader>1 :call CSV_HighlightPrevCol()<CR> 
map <leader>2 :call CSV_HighlightNextCol()<CR> 
map <leader>3 :call CSV_goto_field()<CR>
map <leader>4 :call CSV_SE()<CR>

function! CSVSELECT()

 function! CSV_SE(...)
   if a:0 == 0
     call inputsave()
     let b:current_csv_flag = input('comma, or tab? ')
     call inputrestore()
   else
	   let b:current_csv_flag = a:1
   endif

   if b:current_csv_flag == ','
	 call CSVSettings()
   elseif  b:current_csv_flag == 'comma'
	 call CSVSettings()
   else
	 call CSVTabs()
   endif
endfunction 

function! CSVSettings() 
  let b:current_csv_col = 0 
  " inspired by Vim tip #667 
  function! CSV_Highlight(x) 
    if b:current_csv_col == 0 
      match Keyword /^[^,]*,/ 
    else 
      execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/' 
    endif 
    execute 'normal ^'.a:x.'f,' 
  endfunction 

  " start by highlighting something, probably the first column 
  call CSV_Highlight(b:current_csv_col) 

  function! CSV_HighlightNextCol() 
   let b:current_csv_col = b:current_csv_col + 1 
   call CSV_Highlight(b:current_csv_col) 
  endfunction 

  function! CSV_HighlightPrevCol() 
    if b:current_csv_col > 0 
      let b:current_csv_col = b:current_csv_col - 1 
    endif 
    call CSV_Highlight(b:current_csv_col) 
  endfunction 

 function! CSV_goto_field(...)
   if a:0 == 0
     call inputsave()
     let b:current_csv_col = input('Jump to field? ')
     call inputrestore()
   else
     let b:current_csv_col = a:1
   endif
   call CSV_Highlight(b:current_csv_col)
  endfunction 

endfunction

function! CSVTabs() 
  let b:current_csv_col = 0 
  " inspired by Vim tip #667 
  function! CSV_Highlight(x) 
    if b:current_csv_col == 0 
      match Keyword /^[^	]*	/ 
    else 
      execute 'match Keyword /^\([^	]*	\)\{'.a:x.'}\zs[^	]*/' 
    endif 
    execute 'normal ^'.a:x.'f	' 
  endfunction 

  " start by highlighting something, probably the first column 
  call CSV_Highlight(b:current_csv_col) 

  function! CSV_HighlightNextCol() 
   let b:current_csv_col = b:current_csv_col + 1 
   call CSV_Highlight(b:current_csv_col) 
  endfunction 

  function! CSV_HighlightPrevCol() 
    if b:current_csv_col > 0 
      let b:current_csv_col = b:current_csv_col - 1 
    endif 
    call CSV_Highlight(b:current_csv_col) 
  endfunction 

 function! CSV_goto_field(...)
   if a:0 == 0
     call inputsave()
     let b:current_csv_col = input('Jump to field? ')
     call inputrestore()
   else
     let b:current_csv_col = a:1
   endif
   call CSV_Highlight(b:current_csv_col)
  endfunction 

 endfunction
 call CSVSettings()
endfunction

