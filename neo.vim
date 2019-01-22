set nocompatible
set hlsearch
filetype off
filetype plugin indent on
filetype plugin on
set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set incsearch
set list
set listchars=tab:▸\ ,trail:. ",eol:¬
set mouse=a
set scrolloff=5
set laststatus=2
set nobackup
set noswapfile

call plug#begin()

Plug 'nightsense/cosmic_latte'
Plug 'adimit/prolog.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'VundleVim/Vundle.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Plug 'tpope/vim-unimpaired'
"Plug 'airblade/vim-gitgutter'
"Plug 'scrooloose/nerdtree'
"Plug 'Valloric/YouCompleteMe'
"Plugin 'posva/vim-vue'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'pangloss/vim-javascript'
"Plugin 'moll/vim-node'

call plug#end()

"NERDTree
"map <silent> <C-n> :NERDTreeToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Color Scheme
"if strftime('%H') >= 7 && strftime('%H') < 19
"  set background=light
"  let g:airline_theme='cosmic_latte_light'
"else
  set background=dark
  let g:airline_theme='cosmic_latte_dark'
"endif
colorscheme cosmic_latte

"Airline
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
":let g:airline_theme='murmur'

"Signify
let g:signify_disable_by_default=0
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

"Mapping
nmap     <C-J>     ]e
nmap     <C-K>     [e

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <silent>  tk  :bn<CR>
nnoremap <silent>  tj  :bp<CR>

noremap <C-S>      :update<CR>
vnoremap <C-S>     <C-C>:update<CR><Esc>
inoremap <C-S>     <C-O>:update<CR><Esc>

noremap <C-Z>      :undo<CR>
vnoremap <C-Z>     <C-C>:undo<CR>
inoremap <C-Z>     <C-O>:undo<CR>
