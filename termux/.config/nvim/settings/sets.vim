" general sets
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
syntax enable

set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap

" Tab handling for html, xml, css, js, etc
autocmd filetype html,css,typescript,json,xml,javascript,sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" Highlight the line on which the cursor lives.
set nocursorline

" tab handling
set expandtab
set smarttab
set autoindent
set backspace=indent,eol,start

" disable autocomment
autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Always show at least one line above/below the cursor.
set scrolloff=3
" Always show at least one line left/right of the cursor.
"set sidescrolloff=8

" Relative line numbers
set relativenumber

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Use system clipboard
set clipboard=unnamedplus

" Remove timeout for partially typed commands
set notimeout

" Indentation
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set smartindent
set autoindent
"set cindent

set nocompatible
filetype plugin indent on

" Write buffer through sudo (works on vim but not neovim)
" cnoreabbrev w!! w !sudo -S tee % >/dev/null
" Neovim: suda plugin
cnoreabbrev w!! w suda://%

" Allow switching between buffers without saving
set hidden

" Mouse support
set mouse=a

"Case insensitive searching
set ignorecase

"Will automatically switch to case sensitive if you use any capitals
set smartcase

" Auto toggle smart case of for ex commands
" Assumes 'set ignorecase smartcase'
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Substitute live preview
set inccommand=nosplit

" Markdown Folding
let g:markdown_fold_style = 'nested'

" Vimwiki
" let g:vimwiki_list = [{'path': '~/dox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext=0
let g:vimwiki_table_mappings=0
let g:vimwiki_folding='expr'
nmap <leader>vv <Plug>VimwikiIndex
nmap <leader>vV <Plug>VimwikiTabIndex
nmap <leader>vs <Plug>VimwikiUISelect
nmap <leader>vi <Plug>VimwikiDiaryIndex
nmap <leader>vdd <Plug>VimwikiMakeDiaryNote
nmap <leader>vDD <Plug>VimwikiTabMakeDiaryNote
nmap <leader>vdy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>vdt <Plug>VimwikiMakeTomorrowDiaryNote
nmap <M-space> <Plug>VimwikiToggleListItem

" Highlighted yank (-1 for persistent)
let g:highlightedyank_highlight_duration = 400

" If statusline is enabled, don't show mode under it
set noshowmode

" Shell
set shell=/data/data/com.termux/files/usr/bin/zsh

" Ctrlp
let g:ctrlp_switch_buffer = '0'
" Useful for large projects
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10
" So that it does not only index starting from current directory
let g:ctrlp_working_path_mode = ""
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Use ag AKA the_silver_searcher for indexing. Faster!!!
" TIP: Use ~/.ignore to ignore directories/files
" set grepprg=ag\ --nogroup\ --nocolor
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
""if executable('ag')
""  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
""endif
let g:ctrlp_show_hidden =1
let g:ctrlp_clear_cache_on_exit = 0

" Lightline
" Get default from :h lightline
"let g:lightline = {
"    \ 'colorscheme': 'colors',
"    \ }
"
"let g:lightline.active = {
"    \ 'left': [ [ 'mode', 'paste', 'sep1' ],
"    \           [ 'readonly', 'ficolorsme', 'modified' ],
"    \           [ ] ],
"    \ 'right': [ [ 'lineinfo' ],
"    \            [ 'percent' ],
"    \            [ 'filetype' ] ]
"    \ }
"
"let g:lightline.inactive = {
"    \ 'left': [ [ 'mode', 'paste', 'sep1' ],
"    \           [ 'readonly', 'ficolorsme', 'modified' ] ],
"    \ 'right': [ [ 'lineinfo' ],
"    \            [ 'percent' ],
"    \            [ 'filetype' ] ]
"    \ }
"
"let g:lightline.tabline = {
"    \ 'left': [ [ 'tabs' ] ],
"    \ 'right': [ ] }
"
"let g:lightline.tab = {
"    \ 'active': [ 'tabnum', 'ficolorsme', 'modified' ],
"    \ 'inactive': [ 'tabnum', 'ficolorsme', 'modified' ] }
"
"let g:lightline.component = {
"    \ 'mode': '%{lightline#mode()}',
"    \ 'absolutepath': '%F',
"    \ 'relativepath': '%f',
"    \ 'ficolorsme': '%t',
"    \ 'modified': '%M',
"    \ 'bufnum': '%n',
"    \ 'paste': '%{&paste?"PASTE":""}',
"    \ 'readonly': '%R',
"    \ 'charvalue': '%b',
"    \ 'charvaluehex': '%B',
"    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
"    \ 'fileformat': '%{&ff}',
"    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
"    \ 'percent': '%3p%%',
"    \ 'percentwin': '%P',
"    \ 'spell': '%{&spell?&spelllang:""}',
"    \ 'lineinfo': '%3l:%-2v',
"    \ 'line': '%l',
"    \ 'column': '%c',
"    \ 'close': '%999X X ',
"    \ 'winnr': '%{winnr()}',
"    \ 'sep1': ''
"    \}
"
"let g:lightline.mode_map = {
"    \ 'n' : 'N',
"    \ 'i' : 'I',
"    \ 'R' : 'R',
"    \ 'v' : 'V',
"    \ 'V' : 'L',
"    \ "\<C-v>": 'B',
"    \ 'c' : 'C',
"    \ 's' : 'S',
"    \ 'S' : 'S-LINE',
"    \ "\<C-s>": 'S-BLOCK',
"    \ 't': 'T',
"    \ }
"
"
"let g:lightline.separator = {
"    \   'left': '', 'right': ''
"    \}
"let g:lightline.subseparator = {
"    \   'left': '', 'right': '' 
"    \}
"
"let g:lightline.tabline_separator = g:lightline.separator
"let g:lightline.tabline_subseparator = g:lightline.subseparator
"
"let g:lightline.enable = {
"    \ 'statusline': 1,
"    \ 'tabline': 1
"    \ }

" deoplete
"let g:deoplete#enable_at_startup = 1
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

set wildmenu

" Colorscheme
"colorscheme colors
set fillchars=vert:▎

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

source $HOME/.config/nvim/statusline.vim
"set guicursor=n-ci:hor30-iCursor-blinkwait300-blinkon200-blinkoff150

autocmd StdinReadPre * let s:std_in=1


let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

hi Directory guifg=#FF0000 ctermfg=white
