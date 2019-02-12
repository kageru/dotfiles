set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'zah/nim.vim'
Plugin 'scrooloose/syntastic'
Plugin 'w0ng/vim-hybrid'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'udalov/kotlin-vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'zxqfl/tabnine-vim'

call vundle#end()            " required
"set rtp+=~/code/tabnine-vim
filetype plugin on
autocmd BufNewFile,BufRead *.vpy setfiletype python


set number
set showmatch
 
set hlsearch
set ignorecase
set smartcase
set incsearch
 
set autoindent
set cindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set relativenumber
 
" set beam cursor in insert mode
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

set autochdir
 
set undolevels=1000
set backspace=indent,eol,start

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background=dark
colorscheme hybrid
syntax on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

