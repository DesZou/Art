"compatible
set nocp
set noswapfile

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
inoremap {<CR> {<CR>}<ESC>O
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
