" Fitxer de configuració del vim
"
set nocompatible
set encoding=utf-8

" colors
" colorscheme desert
colorscheme darkburn
"
" coding
set filetype        " filetype detection on
filetype plugin on  " plugin detection
set autochdir       " always switch to the current file directory
set number          " line numbers
set hlsearch        " highlight search
set incsearch       " show search matches while typing
" change highlight colors for search to ease distinction
highligh Search guibg=LightGrey guifg=DarkBlue
highligh IncSearch guibg=DarkBlue guifg=Yellow
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
filetype indent on  " detection of indentation scripts
set smartindent     " advanced indent
set backspace=indent,eol,start
set tabstop=4       " tab with
set shiftwidth=4    " tabs
set softtabstop=4   " tabs
set expandtab       " don't use real tabs
"
" backups
set backup           " backup files
set backupdir=~/tmp/vitmp,. " backup files
set directory=~/tmp/vitmp,. " swap files
"
" map
" up/down keys move one line not paragraph
map <Up> gk
map <Down> gj
"
" reload when source changes
checktime
set autoread
"
" Some filetype distinctions
autocmd Filetype rst set textwidth=70
autocmd Filetype rst set formatoptions-=q   " to avoid considering * as comments
autocmd Filetype rst behave mswin           " allow ctrl-shif selection
autocmd Filetype rst set spell              " spell check on
autocmd Filetype rst set spelllang=ca       " spell language catalan
" considera comentaris només per la primera línia.
autocmd Filetype rst set comments=fb:-,fb:*,fb://

"autocmd Filetype rst colorscheme darkburn
"
" share clipboard vim from-to X Window 
" following http://www.reddit.com/r/vim/comments/m9tcz/ask_rvim_anyone_successfully_mapped_yankpaste/
if has('unnamedplus') 
    set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnamed register
endif
" Elimina la toolbar
set guioptions-=T

" Remove scrollbars: useful for tiling wm as Awesome WM.
:set guioptions-=L
:set guioptions-=l
:set guioptions-=R
:set guioptions-=r
:set guioptions-=b
:set guioptions-=h
"
"
" Afegeix un $ al final del text afectat per una comanda (c)hange
set cpoptions+=$
"
" càrrega de templates (si existeixen)
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
"
" maps per saltar entre marques dels templates <+MARCA+>
"nnoremap <c-Tab> /<+.\{-1,}+><cr>c/+>/e<cr>
"inoremap <c-Tab> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

