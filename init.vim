" Dez's init.vim
"
" vim-plug
call plug#begin()
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
call plug#end()

" do not use extra files
set noswapfile
set nobackup

" display
set number
set wildmenu
set showcmd
set noshowmode
set cursorline
set lazyredraw
set termguicolors
set mouse      =a
set laststatus =2
set background =light

" increase origin functions
set ignorecase
set smartcase
set magic
set incsearch

syntax   on

filetype plugin indent on


" for coloschemes
let g:gruvbox_italic            =1
let g:gruvbox_italicize_strings =1
let g:neosolarized_bold         =1
let g:neosolarized_underline    =1
let g:neosolarized_italic       =1
colorscheme gruvbox

" lightline settings
let g:lightline = {
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'fugitive': 'LightlineFugitive'
            \ },
            \ 'colorscheme': 'gruvbox'
            \ }

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

" startify
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
                \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header(['🌹 NEOVIM'])

" indent
set tabstop     =4
set shiftwidth  =0
set softtabstop =0
set expandtab
set cinoptions  =(0,W4

" compiler
autocmd Filetype cpp     compiler gcc    | setlocal makeprg =g++\ %\ -o\ %<\ -Wall
autocmd Filetype c       compiler gcc    | setlocal makeprg =gcc\ %\ -o\ %<\ -Wall
autocmd Filetype go      compiler go     | setlocal makeprg =go\ build\ %
autocmd Filetype python  compiler pylint | setlocal makeprg =pylint\ %
autocmd Filetype haskell compiler ghc    | setlocal makeprg =ghc\ %
autocmd Filetype pascal  compiler fpc    | setlocal makeprg =fpc\ %

" mapleader
let mapleader   =" "
let g:mapleader =" "

inoremap <c-x> <c-o>:w<cr>

" special keys
nnoremap <leader> :
nnoremap <leader><leader>d :NERDTree<cr>
nnoremap <leader><leader>c :make<cr>
nnoremap <leader><leader>g :make -std=c++11<cr>
