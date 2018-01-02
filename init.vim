"vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify', { 'on': 'Welcome' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"swapfile
set noswapfile

"display
set number
set wildmenu
set showcmd
set noshowmode
set cursorline

syntax   on
filetype on

set mouse      =a
set laststatus =2
set termguicolors
colorscheme gruvbox

let g:lightline = {'colorscheme': 'gruvbox'}

"indent
set autoindent
set smartindent
set cindent

"tabstop
set tabstop     =4
set shiftwidth  =4
set softtabstop =4
set expandtab

"compile C++
compiler gcc
set makeprg =g++\ %\ -o\ %<\ -Wall

"keymaps
inoremap <C-x> <C-o>:w<CR>
nnoremap <Leader> :make<CR>
nnoremap <M-j> :tabn<CR>
nnoremap <M-k> :tabp<CR>
