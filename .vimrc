"let g:solarized_termtrans=1 "terminal setting for color

filetype plugin indent on

set backspace=indent,eol,start

syntax on

"for :find file, set path= current directory, and all its child directories
set path=.,**

"highlight term incrementally as you type it, use :nohl to remove highlight after
set hlsearch incsearch

colorscheme koehler "pretty colors

set bg=dark "dark background

set shiftwidth=2 tabstop=2 softtabstop=4 expandtab autoindent smartindent "set tabs to 2 spaces

set noswapfile "no swap files (dont use virtual memory)

set hidden "Allow switching buffers without saving first (prevent no write sincle last change warning)

let g:netrw_banner = 0 "No header spam in directory mode

let g:netrw_liststyle=3 "Tree style

:set shell=/usr/bin/bash

:set number relativenumber
