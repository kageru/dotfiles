filetype on
filetype plugin on
autocmd BufNewFile,BufRead *.vpy setfiletype python
autocmd BufNewFile,BufRead *.kt setfiletype kotlin
set hidden

set number
set showmatch
 
set hlsearch
set ignorecase
set smartcase
set incsearch
 
set autoindent
set cindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
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
set termguicolors
colorscheme monokai_pro
syntax on

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
nmap <F2> :Vexplore<Return>
autocmd BufNewFile,BufRead *.rs nmap <C-A-L> :RustFmt<Return>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

set splitbelow
set splitright

nmap <S-Tab> :Snippets<CR>
nmap <C-G> :Files<CR>
imap <C-G> <Esc>:Files<CR>
nmap <S-L> :BLines<CR>
nmap <C-F> :Lines<CR>
nmap <C-B> :Buffers<CR>
imap <C-B> <Esc>:Buffers<CR>
nmap <C-space> :RustHoverActions<CR>:RustHoverActions<CR>

let g:ackprg = 'rg --vimgrep --smart-case'
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1
nnoremap <Leader>/ :Ack!<Space>

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua require('plugins')
lua require('lspstuff')
lua require('completion')
lua require('mason').setup()

set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
