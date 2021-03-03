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

" ctrl+s == save
nmap <C-s> <esc>:w<cr>
vmap <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>

" ctrl+q == quit
nmap <C-q> <esc>:q<cr>
vmap <C-q> <esc>:q<cr>
imap <C-q> <esc>:q<cr>

" ctrl+b == NERDTree
nmap <C-b> <esc>:NERDTree<cr>
vmap <C-b> <esc>:NERDTree<cr>
imap <C-b> <esc>:NERDTree<cr>

" Ctrl-a left text Ctrl-e right text (Beginning and end of line)
nmap <C-a> <home>
nmap <C-e> <end>
imap <C-a> <home>
imap <C-e> <end>
cmap <C-a> <home>
cmap <C-e> <end>

" Control-C Copy in visual mode
vmap <C-C> y

" Control-V Paste in insert aand command mode
imap <C-V> <esc>pa
cmap <C-V> <C-r>0

" Alt-z Wrap text
nmap <M-z> <esc>:set wrap<cr>
vmap <M-z> <esc>:set wrap<cr>
imap <M-z> <esc>:set wrap<cr>

" Control-Alt-z Wrap text
nmap <C-M-z> <esc>:set nowrap<cr>
vmap <C-M-z> <esc>:set nowrap<cr>
imap <C-M-z> <esc>:set nowrap<cr>

" Control-Alt-t Move to first line (Shift-g move to end line)
nmap <C-M-t> <esc>:m 0<cr>
vmap <C-M-t> <esc>:m 0<cr>
imap <C-M-t> <esc>:m 0<cr>

" Control-Alt-n Toggle Hybrid Line Number
nmap <C-M-n> <esc>:set nu! rnu!<cr>
vmap <C-M-n> <esc>:set nu! rnu!<cr>
imap <C-M-n> <esc>:set nu! rnu!<cr>

" Contol-Alt-b Turn hybrid line numbers off
" nmap <C-M-b> <esc>:set nonu nornu<cr>
" vmap <C-M-b> <esc>:set nonu nornu<cr>
" imap <C-M-b> <esc>:set nonu nornu<cr>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Shell
set shell=/usr/bin/zsh

" NERDTree Show Hidden Files
let NERDTreeShowHidden=1

" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 

" search highlight dissapeared
