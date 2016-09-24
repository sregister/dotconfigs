call pathogen#infect()
set nocompatible
set go-=T
set number
set smartindent
set tabstop=2
set shiftwidth=2
filetype plugin on
filetype indent on
set autochdir
syntax on
set t_Co=256
set laststatus=2
color wombat256i


let g:airline_powerline_fonts=1

"feel free to add more stuff after the header in ctmpl.txt
"make sure the last line is a single .
"to make a header for other file exention copy and paste these lines
"and replace all *.c with *.cpp
"
"
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

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

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
