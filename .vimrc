"
" Vundle's requirements

set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" My bundles
Bundle 'https://github.com/Rykka/riv.vim.git'
Bundle 'darkburn'
Bundle 'surround.vim'


"
" Encoding
set encoding=utf-8

" Colors
colorscheme darkburn

set hlsearch        " highlight search

" change highlight colors for search to ease distinction
highligh Search     guibg=DarkYellow guifg=DarkGreen
highligh IncSearch  guibg=DarkBlue guifg=Yellow
highligh Cursor     guibg=Yellow guifg=DarkBlue

" coding
syntax on           " syntax highlight
filetype plugin on  " plugin detection
set autochdir       " always switch to the current file directory
set number          " line numbers
set hlsearch        " highlight search
set incsearch       " show search matches while typing

set showmatch       " show matching elements
set ignorecase      " case unsensitive search
set smartcase       " if there are caps go case-sensitive
set history=2000    " history length
set showcmd         " show mode
set list            " show hidden chars
"set listchars=tab:^T,eol:·	" hidden chars representation
set listchars=tab:→\ ,trail:·,extends:>,eol:¶" hidden chars representation
set statusline=%F%m%h%w\ [%p%%]
set clipboard=unnamed " advanced clipboard
set omnifunc=on     " autocomplete function
set completeopt=menu,preview " autocomplete function
set wildmenu        " command-line completion
set scrolloff=3     " lines before EOF
"
set autoindent      " code autoindent
set smartindent     " advanced indent
set backspace=indent,eol,start
set tabstop=4       " tab with
set shiftwidth=4    " tabs
set softtabstop=4   " tabs
set expandtab       " don't use real tabs
set textwidth=70    " default width

" backups
set backup           " backup files
set backupdir=~/tmp/vitmp,. " backup files
set directory=~/tmp/vitmp,. " swap files

" mappings
" up/down keys move one line not paragraph
map <Up> gk
map <Down> gj
" Mapping for continued indentation on visual
vnoremap > >gv
vnoremap < <gv
" Mapping for fast :nohlsearch
nmap <C-h> :noh<CR>

" reload when source changes
checktime
set autoread

" share clipboard with system's
set clipboard=unnamedplus

" Remove some gui options
set guioptions-=T   " Elimina la toolbar
set guioptions-=m   " remove the menu bar

" Remove scrollbars: useful for tiling wm as Awesome WM.
set guioptions-=L   " remove left scrollbars: on splitted windows
set guioptions-=l   " remove left scrollbar
set guioptions-=R   " remove right scrollbar on
set guioptions-=r   " remove right scrollbar
set guioptions-=b   " remove bottom scrollbar
set guioptions-=h   " limit the scrolling to the current cursor line
"
"
" Afegeix un $ al final del text afectat per una comanda (c)hange
set cpoptions+=$
"
" càrrega de templates (si existeixen)
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
"

