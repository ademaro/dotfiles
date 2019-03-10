set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
    " Jedi Autocomplit http://habrahabr.ru/post/192610/
    "Plugin 'davidhalter/jedi-vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
" HTML/HAML
    " ZenCoding
    Plugin 'mattn/emmet-vim'
    " HTML5 omnicomplete and syntax
    "Plugin 'git://github.com/othree/html5.vim.git'
    "Plugin 'git://github.com/hokaccha/vim-html5validator.git'
" CSS/LESS
    " CSS3 syntax support
    Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
    " Highlight colors in css files
    Bundle 'git://github.com/ap/vim-css-color.git'
    Bundle 'git://github.com/groenewege/vim-less.git'
    Bundle 'git://github.com/miripiruni/vim-better-css-indent.git'
    Bundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'

call vundle#end()

filetype plugin indent on

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
  
set t_Co=256
colorscheme xoria256
syntax on

set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
