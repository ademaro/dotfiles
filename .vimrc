set t_Co=256
colorscheme xoria256
syntax on

set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
