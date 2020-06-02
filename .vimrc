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
"Plugin 'zah/nim.vim'
Plugin 'scrooloose/syntastic'
Plugin 'w0ng/vim-hybrid'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'udalov/kotlin-vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'phanviet/vim-monokai-pro'
"Plugin 'wincent/command-t'
Plugin 'cespare/vim-toml'
Plugin 'sirver/UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf'
"Plugin 'ervandew/supertab'

" rp call thing for auto completion with language servers
Plugin 'roxma/nvim-yarp'
" language client stuff
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-jedi'
Plugin 'ncm2/ncm2-ultisnips'
Plugin 'ncm2/ncm2-racer'
Plugin 'zxqfl/tabnine-vim'


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

call vundle#end()            " required
"set rtp+=~/code/tabnine-vim
filetype plugin on
autocmd BufNewFile,BufRead *.vpy setfiletype python
autocmd BufNewFile,BufRead *.kt set ft=kotlin

" for ncm2 completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
"inoremap <expr> <Tab> (pumvisible() ? "\<CR>" : "\<Tab>")
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Required for operations modifying multiple buffers like rename.
set hidden

    "\ 'rust': ['rustup', 'run', 'stable', 'rls'],
    "\ 'rust': ['rust-analyzer'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'go': ['gopls'],
    \ 'kotlin': ['/usr/bin/kotlin-language-server'],
    \ 'c': ['/usr/bin/ccls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F6> :call LanguageClient#textDocument_rename()<CR>

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

set undolevels=1000
set backspace=indent,eol,start

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:autofmt_autosave = 1
set termguicolors
colorscheme monokai_pro
syntax on

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
nmap <F2> :Vexplore<Return>
nmap <C-A-L> :RustFmt<Return>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_write = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
nmap <F3> :SyntasticCheck<CR>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
set splitbelow
set splitright
