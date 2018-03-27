"vim-plug
call plug#begin()
Plug 'romainl/flattened'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify', { 'on': 'Disabled' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
call plug#end()

set noswapfile
set nobackup

"display
set number
set wildmenu
set showcmd
set noshowmode
set cursorline
set incsearch
set lazyredraw

syntax   on
filetype plugin indent on

set termguicolors
set mouse      =a
set laststatus =2
set background =light
let g:gruvbox_italic            =1
let g:gruvbox_italicize_strings =1
colorscheme gruvbox

let g:lightline = { 'colorscheme': 'gruvbox' }

"tabstop
set tabstop     =4
set shiftwidth  =4
set softtabstop =4
set expandtab

"compile
autocmd Filetype cpp     compiler gcc    | setlocal makeprg =g++\ %\ -o\ %<\ -Wall
autocmd Filetype c       compiler gcc    | setlocal makeprg =gcc\ %\ -o\ %<\ -Wall
autocmd Filetype go      compiler go     | setlocal makeprg =go\ build\ %
autocmd Filetype python  compiler pylint | setlocal makeprg =pylint\ %
autocmd Filetype haskell compiler ghc    | setlocal makeprg =ghc\ %
autocmd Filetype pascal  compiler fpc    | setlocal makeprg =fpc\ %

"keymaps
let mapleader   =" "
let g:mapleader =" "
inoremap <c-x> <c-o>:w<cr>
nnoremap <leader> :
nnoremap <leader><leader>d :NERDTreeToggle<cr>
nnoremap <leader><leader>c :make<cr>
