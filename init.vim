"vim-plug
call plug#begin()
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify', { 'on': 'Disabled' }
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

set termguicolors
set mouse      =a
set laststatus =2
set background =light
let g:gruvbox_italic            =1
let g:gruvbox_italicize_strings =1
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

"compile
function Compile()
    if &filetype == 'cpp'
        compiler gcc
        set makeprg =g++\ %\ -o\ %<\ -Wall
    elseif &filetype == 'c'
        compiler gcc
        set makeprg =gcc\ %\ -o\ %<\ -Wall
    elseif &filetype == 'go'
        compiler go
        set makeprg =go\ build\ %
    else
        set makeprg =echo\ ???\ UNKNOWN\ FILETYPE
    endif
    execute "make"
endfunction

"keymaps
inoremap <C-x> <C-o>:w<CR>
nnoremap <Leader> :call Compile()<CR>
