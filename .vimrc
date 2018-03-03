set nocompatible
set hlsearch
filetype off

call plug#begin()

Plug 'adimit/prolog.vim'
Plug 'lifepillar/vim-mucomplete'
"Plug 'Valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
"Plugin 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
"Plugin 'ternjs/tern_for_vim'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'

"Plugin 'pangloss/vim-javascript'
"Plugin 'moll/vim-node'

call plug#end()

filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:filetype_pl="prolog"

let g:airline_powerline_fonts = 1 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
:let g:airline_theme='murmur'

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"  
let g:javascript_plugin_jsdoc = 1

set completeopt-=preview
syntax on
"set background=dark
colorscheme palenight

map <silent> <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|git'

set relativenumber
set number

set expandtab
set tabstop=2
set shiftwidth=2
set incsearch
set list
set listchars=tab:▸\ ,trail:.,eol:¬

nmap <C-J> ]e
nmap <C-K> [e
