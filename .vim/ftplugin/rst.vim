" Mostly obtained from http://blog.tuxcoder.com/2008/12/11/vim-restructuretext-macros/
" Ctrl-U 1:    underline Parts w/ #'s
noremap  <C-U>1 yyPVr#yyjp
inoremap <C-U>1 <esc>yyPVr#yyjpA

" Ctrl-U 2:    underline Chapters w/ *'s
noremap  <C-U>2 yyPVr*yyjp
inoremap <C-U>2 <esc>yyPVr*yyjpA

" Ctrl-U 3:    underline Section Level 1 w/ ='s
noremap  <C-U>3 yypVr=
inoremap <C-U>3 <esc>yypVr=A

" Ctrl-U 4:    underline Section Level 2 w/ -'s
noremap  <C-U>4 yypVr-
inoremap <C-U>4 <esc>yypVr-A

" Ctrl-U 5:    underline Section Level 3 w/ ^'s
noremap  <C-U>5 yypVr^
inoremap <C-U>5 <esc>yypVr^A
"
" Ctrl-U 6:    underline Section Level 4 w/ ~'s
noremap  <C-U>6 yypVr~
inoremap <C-U>6 <esc>yypVr~A
