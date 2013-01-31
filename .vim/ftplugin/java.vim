" Utilitats per programar en java
"
" Following: http://gitcafe.com/belltoy/vimrc/blob/master/vim/ftplugin/java/my.vim
func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" iabbr <buffer> sout System.out.println("");<Left><Left><Left><C-R>=Eatchar('\s')<CR>

" iabbr <buffer> main() public static void main(String[] args) {}<Left><C-R>=Eatchar('\s')<CR>
