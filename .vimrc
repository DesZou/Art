set nocp sc is nu wmnu et tgc
set ts =4 sw =4 sts =4 mouse =a mp =g++\ %\ -o\ %<\ -Wall cino =(0
sy on
filet plugin indent on
au insertleave * silent exec '!echo -e "\e[1 q"' | redr!
au insertenter * silent exec '!echo -e "\e[5 q"' | redr!
"au insertleave * silent exec '!gconftool-2 --key string --set
"/apps/gnome-terminal/profiles/Default/cursor_shape block'
"au insertenter * silent exec '!gconftool-2 --key string --set
"/apps/gnome-terminal/profiles/Default/cursor_shape ibeam'
colo morning
comp gcc
nno <leader> :make<cr>
ino <c-x> <c-o>:w<cr>
ino <c-c> <esc>
ino {<cr> {<cr>}<esc>O
ino { {}<esc>i
ino ( ()<esc>i
ino [ []<esc>i
ino <expr><silent> ' getline('.')[col('.') - 1] == "'" ? "\<right>" : "''\<left>" 
ino <expr><silent> " getline('.')[col('.') - 1] == '"' ? "\<right>" : "\"\"\<left>" 
ino <expr><silent> ) getline('.')[col('.') - 1] == ')' ? "\<right>" : ")"
ino <expr><silent> ] getline('.')[col('.') - 1] == ']' ? "\<right>" : "]"
ino <expr><silent> } getline('.')[col('.') - 1] == '}' ? "\<right>" : "}"
