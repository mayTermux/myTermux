" general set
set encoding=utf-8
set fileencoding=utf-8
syntax enable
set noswapfile
set nowrap 

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
set clipboard+=unnamedplus

" ctrl+s == save
nmap <C-s> <esc>:w<cr>
vmap <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>

" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 

" search highlight dissapeared
nnoremap <silent><esc> <esc>:noh<cr>
