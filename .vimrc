set nocp noswf sc is nu wmnu et lz tgc
set ts =4 sw =4 sts =4 mouse =a mp =g++\ %\ -o\ %<\ -Wall
sy on
filet plugin indent on
colo morning
comp gcc
nno <leader> :make<cr>
ino <c-x> <c-o>:w<cr>
ino { {}<esc>i
ino {<cr> {<cr>}<esc>O
ino ( ()<esc>i
ino [ []<esc>i
ino ' <c-r>=repeat(Jump("'"), 2)<cr><esc>i
ino " <c-r>=repeat(Jump('"'), 2)<cr><esc>i
ino ) <c-r>=Jump(')')<cr>
ino } <c-r>=Jump('}')<cr>
ino ] <c-r>=Jump(']')<cr>
function Jump(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<right>"
    else
        return a:char
    endif
endfunction
