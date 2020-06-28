set nocompatible              " be iMproved, required
filetype on                  " required

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'phanviet/vim-monokai-pro'
Plug 'cespare/vim-toml'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'ervandew/supertab'

" rp call thing for auto completion with language servers
Plug 'roxma/nvim-yarp'
" language client stuff
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-racer'
"Plug 'zxqfl/tabnine-vim'


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"call vundle#end()            " required
call plug#end()
"set rtp+=~/code/tabnine-vim
filetype plugin on
autocmd BufNewFile,BufRead *.vpy setfiletype python
autocmd BufNewFile,BufRead *.kt set ft=kotlin

" for ncm2 completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Required for operations modifying multiple buffers like rename.
set hidden

    "\ 'rust': ['rustup', 'run', 'stable', 'rls'],
    "\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'go': ['gopls'],
    \ 'kotlin': ['/usr/bin/kotlin-language-server'],
    \ 'c': ['/usr/bin/ccls'],
    \ 'java': ['jdtls'],
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

nmap <S-Tab> :Snippets<CR>
nmap <C-G> :Files<CR>
imap <C-G> <Esc>:Files<CR>
nmap <S-L> :BLines<CR>
nmap <C-F> :Lines<CR>
