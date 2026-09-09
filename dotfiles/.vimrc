set nocompatible
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
" display completion matches in a status line
set wildmenu
" Show @@@ in the last line if it is truncated.
set display=truncate
" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5
" Do incremental searching 
set incsearch

set number
set relativenumber

syntax on
filetype plugin indent on

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set virtualedit=block

set splitbelow
set splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
