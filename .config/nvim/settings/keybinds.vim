" xShin Keybind for Neovim

" Ctrl+s == save
nmap <C-s> <esc>:w<cr>
vmap <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>

" Ctrl+q == quit
nmap <C-q> <esc>:q<cr>
vmap <C-q> <esc>:q<cr>
imap <C-q> <esc>:q<cr>

" Ctrl+alt+q == quit!
nmap <C-M-q> <esc>:q!<cr>
vmap <C-M-q> <esc>:q!<cr>
imap <C-M-q> <esc>:q!<cr>

" Ctrl+b == NERDTree
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

" Ctrl-Alt-z Wrap text
nmap <C-M-z> <esc>:set nowrap<cr>
vmap <C-M-z> <esc>:set nowrap<cr>
imap <C-M-z> <esc>:set nowrap<cr>

" Ctrl-Alt-t Move to first line (Shift-g move to end line)
"nmap <C-M-t> <esc>:m 0<cr>
"vmap <C-M-t> <esc>:m 0<cr>
"imap <C-M-t> <esc>:m 0<cr>

" Ctrl-Alt-n Toggle Hybrid Line Number
nmap <C-M-n> <esc>:set nu! rnu!<cr>
vmap <C-M-n> <esc>:set nu! rnu!<cr>
imap <C-M-n> <esc>:set nu! rnu!<cr>

" Ctrl-Alt-b Turn hybrid line numbers off
nmap <C-M-b> <esc>:set nonu nornu<cr>
vmap <C-M-b> <esc>:set nonu nornu<cr>
imap <C-M-b> <esc>:set nonu nornu<cr>

" Alt+c Enable termguicolors
nmap <M-c> <esc>:set termguicolors<cr>
vmap <M-c> <esc>:set termguicolors<cr>
imap <M-c> <esc>:set termguicolors<cr>

" Ctrl+Alt+c Disable termguicolors
nmap <C-M-c> <esc>:set notermguicolors<cr>
vmap <C-M-c> <esc>:set notermguicolors<cr>
imap <C-M-c> <esc>:set notermguicolors<cr>

