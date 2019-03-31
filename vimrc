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

set foldmethod=indent
set foldlevelstart=20
nnoremap <space> za

:nmap <silent> <C-D> :NERDTreeToggle<CR>
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
call plug#end()

nnoremap <leader>jd :YcmCompleter GoTo<CR>
