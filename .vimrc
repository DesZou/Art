set nocp sc is wmnu nu tgc
set sw=4 ts=4 sts=4 mp=g++\ -o\ %<\ %\ -Wall cino=(0 mouse=a
sy on
filet plugin indent on
colo morning
comp gcc
ino <c-c> <esc>
ino <c-x> <c-o>:w<cr>
nno <leader> :make<cr>
ino { {}<esc>i
ino ( ()<esc>i
ino [ []<esc>i
ino {<cr> {<cr>}<esc>O
ino <expr><silent> } Isit('}')? "\<right>" : "}"
ino <expr><silent> ) Isit(')')? "\<right>" : ")"
ino <expr><silent> ] Isit(']')? "\<right>" : "]"
ino <expr><silent> ' Isit("'")? "\<right>" : "''\<left>"
ino <expr><silent> " Isit('"')? "\<right>" : "\"\"\<left>"
func Isit(char)
   	return getline('.')[col('.') - 1] == a:char
endf
au insertenter * silent exec '!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam'
au insertleave * silent exec '!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block'
