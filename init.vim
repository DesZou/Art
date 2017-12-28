"compatible
set nocp
set noswapfile

"""""""""""""""""""""""""""""""neovim
"
""vim-plug
"call plug#begin()
"Plug 'godlygeek/tabular'
"Plug 'mhinz/vim-startify'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
"Plug 'jiangmiao/auto-pairs'
"Plug 'itchyny/lightline.vim'
"Plug 'morhetz/gruvbox'
"call plug#end()
"
""extra-display
"set cursorline
"set noshowmode
"set laststatus =2
"
"colorscheme gruvbox
"
""lightline
"let g:lightline = {'colorscheme': 'gruvbox'}
"
"""""""""""""""""""""""""""""""

"display
set nu
set wildmenu
set showcmd

syntax   on
filetype on

set mouse =a
set t_Co  =256
set termguicolors
colorscheme desert

"indent
set ai
set smartindent
set cindent

"tab
set ts  =4
set sw  =4
set sts =4
set et

"compile C++
compiler gcc
set makeprg =g++\ %\ -o\ %<\ -Wall

"keymaps
inoremap <C-x> <C-o>:w<CR>

inoremap { {}<ESC>i
inoremap {<CR> {}<ESC>O
inoremap } <C-r>=ClosePair('}')<CR>

inoremap ( ()<ESC>i
inoremap ) <C-r>=ClosePair(')')<CR>

inoremap [ []<ESC>i
inoremap ] <C-r>=ClosePair(']')<CR>

inoremap " <C-r>=QuoteDelim('"')<CR>
inoremap ' <C-r>=QuoteDelim("'")<CR>

nnoremap <Leader> :make<CR>
nnoremap <M-j> :tabn<CR>
nnoremap <M-k> :tabp<CR>

func ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

func QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == '\'
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<ESC>i"
    endif
endf
