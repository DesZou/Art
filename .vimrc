se nu wmnu sc noswf et ai si cin tgc
se ts=4 sw=4 sts=4 mouse=a mp =g++\ %\ -o\ %<\ -Wall
sy on
filet on
colo desert
comp gcc
ino<C-x> <C-o>:w<CR>
ino { {}<ESC>i
ino {<CR> {<CR>}<ESC>O
ino } <C-r>=ClosePair('}')<CR>
ino ( ()<ESC>i
ino ) <C-r>=ClosePair(')')<CR>
ino [ []<ESC>i
ino ] <C-r>=ClosePair(']')<CR>
ino " <C-r>=QuoteDelim('"')<CR>
ino ' <C-r>=QuoteDelim("'")<CR>
nno <Leader> :make<CR>
func ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
func QuoteDelim(char)
    let lin = getline('.')
    let col = col('.')
    if lin[col - 2] == '\'
        return a:char
    elseif lin[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<ESC>i"
    endif
endf
