" Author : xShin & Annzc
" GitHub : https://github.com/xshin404
"          https://github.com/annzc

nnoremap <silent><esc> <esc>:noh<cr>
" general set
set encoding=utf-8
set fileencoding=utf-8
syntax enable
"set noswapfile
set nowrap 
set mouse=a
set guicursor=

" remove show mode like -INSERT- since statusline
" do that automatically 
set noshowmode

" tab & indentation handling
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set backspace=indent,eol,start

" decor
set relativenumber
set scrolloff=3
set sidescrolloff=7
set cursorline " line pointer highlight

" support devices clipboard
set clipboard=unnamedplus

" Hybrid Line Number
set nu! rnu!

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Shell
set shell=/usr/bin/zsh

" NERDTree Show Hidden Files
let NERDTreeShowHidden=1

" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 

" unset termguicolors / true color

set notermguicolors
