set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'moiatgit/vim-rst-sections.git'
Plugin 'fugitive.vim'
Plugin 'Tabular'
Plugin 'surround.vim'
"Plugin 'vim-scripts/loremipsum'
"Plugin 'vim-scripts/indentpython.vim'
" Plugin 'nvie/vim-flake8'
Plugin 'tComment'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'

"Plugin 'jnurmine/Zenburn'
"Plugin 'jeroenp/vim-xquery-syntax'



call vundle#end()
filetype plugin indent on

" Encoding
set encoding=utf-8

" Ease cut&Paste
set clipboard=unnamedplus " advanced clipboard


" Search and change
set hlsearch " highlight search
highligh Search guibg=DarkYellow guifg=DarkGreen
highligh IncSearch guibg=DarkBlue guifg=Yellow
highligh Cursor guibg=Yellow guifg=DarkBlue
set cpoptions+=$


" status line
" set statusline =
" set statusline +=%{fugitive#statusline()}
" set statusline +=\ %F%m%h%w\ [%p%%]
" set statusline +=[%{winnr()}/%n]   " split nr / buffer nr
" set statusline +=\ %{''!=#&filetype?&filetype:'none'}    " filetype
" set statusline +=%=%-14.(%l,%c%V%)\ %P
set laststatus=2    " show the status line always


" General appearance
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
set listchars=tab:→\ ,trail:·,extends:>,eol:¶" hidden chars representation
set omnifunc=on " autocomplete function
set completeopt=menu,preview " autocomplete function
set wildmenu " command-line completion
set scrolloff=3 " lines before EOF
let &showbreak = '↳ '
set wrap
set cpo=n
set breakindent
set autoindent " code autoindent
set nosmartindent " advanced indent
set backspace=indent,eol,start
set tabstop=4 " tab with
set shiftwidth=4 " tabs
set softtabstop=4 " tabs
set expandtab " don't use real tabs
set textwidth=80  " default width
set cursorline    " highlight current line

" reload when source changes
checktime
set autoread


" allow ctrl-shif selection
behave mswin

"
" Avoid folding at the start
set nofoldenable


" backups
set backup " backup files
set backupdir=~/tmp/vitmp,. " backup files
set directory=~/tmp/vitmp,. " swap files


" mappings

" redefine leader key
let mapleader = "¡"

" up/down keys move one line not paragraph
map <Up> gk
map <Down> gj

" Mapping for continued indentation on visual
vnoremap > >gv
vnoremap < <gv

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
nmap <leader>pd mz:%s/\\n\\+\\(\\s*def \\)/\\r\\r\\r\\1<CR>:noh<CR>`z

" Mapping for quiz formating
nmap <leader>fq :%s/\\n\\+\\ze\\.\\. pregunta:/\\r\\r\\r\\r<CR>:%s/\\n\\+\\.\\.\\s\\+\\ze\\(enunciat\\\|resposta\\)/\\r\\r.. <CR>:noh<CR><c-o>

" Clean up leading whitespace
nmap <leader>fs mz:%s/\\s\\+$/<CR>:noh<CR>`z

" For including paragraphs in undo without leaving insert mode
inoremap <CR> <CR><c-g>u


" Load templates if available
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl


" For encryption
"set viminfo='0,\"0,\/0,:0,f0
autocmd VimEnter * if ! empty(&l:key) | set viminfo='0,\"0,\/0,:0,f0 | echomsg "Adapted for encrypted editing" | endif
setlocal cryptmethod=blowfish2

" Reset new split possitions
set splitbelow
set splitright

" File autocompletion
set wildmode=longest,list,full
set wildmenu

" PEP8
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0 expandtab autoindent smarttab fileformat=unix

autocmd FileType python setlocal suffixes+=.pyc
                      \ setlocal suffixes+=.pyc
                      \ setlocal suffixesadd=.py
                      \ set wildignore+=*.pyc

" Web dev
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 softtabstop=2 shiftwidth=2

" avoid automatic EOL at EOF
set nofixendofline

" font (remember to get another one with ``set guifont=*`` and then ``set guifont?``
set guifont=Noto\ Mono\ 10

" Map comments
noremap <silent> <Leader>cc :TComment<CR>

" lightline configuration
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste'], ['winnr' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename', 'modified'],[ 'winnr' ] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent'  ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'readonly': 'LightlineReadonly',
            \   'winnr': 'winnr',
            \ },
            \ }


function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction


" To allow saving a su file
cmap w!! %!sudo tee > /dev/null %

