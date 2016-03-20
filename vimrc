:call pathogen#infect()
set nocompatible
:set go-=T
:set number
:set tabstop=4
filetype plugin on
filetype indent on
:set autochdir
syntax on
set t_Co=256
:color molokai 
"feel free to add more stuff after the header in ctmpl.txt
"make sure the last line is a single .
"to make a header for other file exention copy and paste these lines
"and replace all *.c with *.cpp
"
"
set foldmethod=indent
set foldlevelstart=20
nnoremap <space> za

"insert ctmpl.txt into every new .c file
autocmd bufnewfile *.c so ~/.vim/ctmpl.txt

"search the file for expressions, insert after with various bits of info
autocmd bufnewfile *.c exe "1," . 6 . "g/Created By :.*/s//Created By : Scott Register ("$USER ")"
autocmd bufnewfile *.c exe "1," . 6 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.c exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%c")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 6 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

"cpp insert
autocmd bufnewfile *.cpp so ~/.vim/ctmpl.txt
autocmd bufnewfile *.cpp exe "1," . 6 . "g/Created By :.*/s//Created By : Scott Register ("$USER ")"
autocmd bufnewfile *.cpp exe "1," . 6 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%c")
autocmd Bufwritepre,filewritepre *.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "1," . 6 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a"

"special binds
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
:nmap <F2> :tabnew
:nmap <F3> :close
:nmap <silent> <C-D> :NERDTreeToggle<CR>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
