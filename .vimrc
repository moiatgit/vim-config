set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'gmarik/vundle'
Plugin 'moiatgit/vim-rst-sections.git'
" Plugin 'darkburn'
"Plugin 'Zenburn'
Plugin 'blackboard.vim'
Plugin 'surround.vim'
Plugin 'SpellCheck'
Plugin 'Tabular'
Plugin 'plantuml-syntax'
"Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'elixir-lang/vim-elixir'
Plugin 'fugitive.vim'
"Plugin 'css3-syntax-plus'
"Plugin 'Css-Pretty'
"Plugin 'elzr/vim-json'
" Java Plugins
"Plugin 'Yggdroot/indentLine'

Plugin 'Rykka/riv.vim'
" Plugin 'othree/xml.vim.git'
" Plugin 'mdekstrand/vim-oz'
" Plugin 'chilicuil/vim-sml-coursera.git'
"Plugin 'Valloric/YouCompleteMe'

" Helping enumerations
Plugin 'vim-scripts/VisIncr'
" Random generator
Plugin 'vim-scripts/loremipsum'

Plugin 'mkitt/tabline.vim'
Plugin 'mattn/emmet-vim'

Plugin 'jeroenp/vim-xquery-syntax'

"Plugin 'trevordmiller/nova-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'

" Syntastic: for syntax checking
"Plugin 'Syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
"" Encoding
set encoding=utf-8

" Colors
autocmd BufEnter * colorscheme blackboard
" autocmd BufEnter * colorscheme nova

" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

set hlsearch " highlight search

" change highlight colors for search to ease distinction
highligh Search guibg=DarkYellow guifg=DarkGreen
highligh IncSearch guibg=DarkBlue guifg=Yellow
highligh Cursor guibg=Yellow guifg=DarkBlue

" coding
syntax on " syntax highlight
filetype plugin on " plugin detection
set autochdir " always switch to the current file directory
set number " line numbers
set hlsearch " highlight search
set incsearch " show search matches while typing
set showmatch " show matching elements
set ignorecase " case unsensitive search
set smartcase " if there are caps go case-sensitive
set history=2000 " history length
set showcmd " show mode
set hidden  " allows edited buffers not visible in any window
set list " show hidden chars
"set listchars=tab:^T,eol:· " hidden chars representation
set listchars=tab:→\ ,trail:·,extends:>,eol:¶" hidden chars representation
" status line
set statusline =
set statusline +=%{fugitive#statusline()}
set statusline +=\ %F%m%h%w\ [%p%%]
set statusline +=[%{winnr()}/%n]   " split nr / buffer nr
set statusline +=\ %{''!=#&filetype?&filetype:'none'}    " filetype
set statusline +=%=%-14.(%l,%c%V%)\ %P
set laststatus=2    " show the status line always

set clipboard=unnamed " advanced clipboard
set omnifunc=on " autocomplete function
set completeopt=menu,preview " autocomplete function
set wildmenu " command-line completion
set scrolloff=3 " lines before EOF
"
let &showbreak = '↳ '
set wrap
set cpo=n
set breakindent
"
set autoindent " code autoindent
set smartindent " advanced indent
set backspace=indent,eol,start
set tabstop=4 " tab with
set shiftwidth=4 " tabs
set softtabstop=4 " tabs
set expandtab " don't use real tabs
set textwidth=74 " default width

set cursorline    " highlight current line
" backups
set backup " backup files
set backupdir=~/tmp/vitmp,. " backup files
set directory=~/tmp/vitmp,. " swap files
" mappings
" up/down keys move one line not paragraph
map <Up> gk
map <Down> gj
" Mapping for continued indentation on visual
vnoremap > >gv
vnoremap < <gv

" reload when source changes
checktime
set autoread
" allow ctrl-shif selection
behave mswin
"
" share clipboard with system's
set clipboard=unnamedplus
" Remove some gui options
set guioptions-=T " Elimina la toolbar
set guioptions-=m " remove the menu bar
" Remove scrollbars: useful for tiling wm as Awesome WM.
set guioptions-=L " remove left scrollbars: on splitted windows
set guioptions-=l " remove left scrollbar
set guioptions-=R " remove right scrollbar on
set guioptions-=r " remove right scrollbar
set guioptions-=b " remove bottom scrollbar
set guioptions-=h " limit the scrolling to the current cursor line
"
" Enable mouse
set mouse=a
"
" Afegeix un $ al final del text afectat per una comanda (c)hange
set cpoptions+=$
"
" càrrega de templates (si existeixen)
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" for rst file
autocmd Filetype rst setlocal spell spelllang=ca
autocmd BufEnter *.rst highlight clear SpellBad
autocmd BufEnter *.rst highlight SpellBad ctermfg=3 term=underline cterm=underline
"
" disable riv auto folding behavior
let g:riv_disable_folding = 1

"
" redefine leader key
let mapleader = "¡"

" Assign quiz extension to rst
autocmd BufRead,BufNewFile *.quiz set filetype=rst

" special indentation for python files
autocmd BufEnter *.py set cindent
autocmd BufEnter *.py set textwidth=0

" Special indentation for XML files
autocmd Filetype xml set softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype xsd set softtabstop=2 shiftwidth=2 expandtab

" Split to the bottom and the right
set splitbelow
set splitright

" Mappings for split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Some mappings for surrounding
vmap <leader>` di``Pbvi`
vmap <leader>* di**Pgvolol
nmap <leader>` viwdi``P
nmap <leader>* viwdi**P
imap <leader>` viwdi``Pa
imap <leader>* viwdi**Pa
"
" Mapping for fast :nohlsearch
nmap <leader>h :noh<CR>
imap <leader>h :noh<CR>

" Mapping for python formating
" separate functions
nmap <leader>pd :%s/\\n\\+\\(\\s*def\\)/\\r\\r\\r\\1<CR>:noh<CR>

" Different formating maps
"
" Mapping for quiz formating
nmap <leader>fq :%s/\\n\\+\\ze\\.\\. pregunta:/\\r\\r\\r\\r<CR>:%s/\\n\\+\\.\\.\\s\\+\\ze\\(enunciat\\\|resposta\\)/\\r\\r.. <CR>:noh<CR><C-o>

" Clean up leading whitespace
nmap <leader>fs :%s/\\s\\+$/<CR>:noh<CR>

" For encryption
"set viminfo='0,\"0,\/0,:0,f0
autocmd VimEnter * if ! empty(&l:key) | set viminfo='0,\"0,\/0,:0,f0 | echomsg "Adapted for encrypted editing" | endif
setlocal cryptmethod=blowfish2

" Search down into subfolders: tab completioin for all file related tasks
set path+=*

" Keep in undo each paragraph
inoremap <CR> <CR><c-g>u

" File autocompletion
set wildmode=longest,list,full
set wildmenu
