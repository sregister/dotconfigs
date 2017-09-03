call pathogen#infect()
set visualbell
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

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

set foldmethod=indent
set foldlevelstart=20
nnoremap <space> za

"special binds
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
:nmap <F2> :tabnew
:nmap <F3> :close
:nmap <silent> <C-D> :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
