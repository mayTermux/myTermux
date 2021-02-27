
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugs')

    " Themes
    Plug 'joshdick/onedark.vim'
    "Plug 'bluz71/vim-nightfly-guicolors'
    "Plug 'morhetz/gruvbox'
    "Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

    " Intellisense code editor
    Plug 'neoclide/coc.nvim'

    " Auto pairs for (), [], "", '', {}
    Plug 'jiangmiao/auto-pairs'

    " Statusline theme
    "Plug 'vim-airline/vim-airline'
    "Plug 'itchyny/lightline.vim'

    " for better syntax highlighting
    Plug 'scrooloose/syntastic'
    Plug 'sheerun/vim-polyglot'
    Plug 'uiiaoo/java-syntax.vim'

    " FUZZY FINDER file finder
    Plug 'junegunn/fzf'

    " NERDTree file explorer
    Plug 'preservim/nerdtree'

    " Lexima Plugin
    Plug 'cohama/lexima.vim'

    " Dev icons displays file's icons 
    Plug 'ryanoasis/vim-devicons'

    " git tracker plugin
    Plug 'airblade/vim-gitgutter'

    " commenter plugin
    Plug 'scrooloose/nerdcommenter'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
