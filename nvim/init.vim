set nocompatible
set hlsearch
syntax on
filetype on
filetype plugin indent on
filetype plugin on
set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set hidden
set autoindent
set smartindent
set incsearch
set list
set listchars=tab:▸\ ,trail:. ",eol:¬
"set mouse=a
set scrolloff=5
set laststatus=2
set nobackup
set noswapfile
set encoding=UTF-8
set guifont=FiraCode\ Nerd\ Font\ 10

call plug#begin()

Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
"Plug 'maksimr/vim-jsbeautify'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Plug 'Valloric/YouCompleteMe'
"Plug 'mhartington/oceanic-next'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'flazz/vim-colorschemes'
"Plug 'nightsense/cosmic_latte'
"Plug 'lifepillar/vim-mucomplete'
"Plug 'ervandew/supertab'
"Plug 'kien/ctrlp.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'VundleVim/Vundle.vim'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
"Plugin 'posva/vim-vue'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'pangloss/vim-javascript'
"Plugin 'moll/vim-node'
"Plug 'adimit/prolog.vim'

call plug#end()

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

"NERDTree
let g:NERDTreeWinPos = "right"
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"CtrlP
"let g:ctrlp_custom_ignore = 'node_modules\|git'

"Color Scheme
"if strftime('%H') >= 7 && strftime('%H') < 19
"  set background=light
"  let g:airline_theme='cosmic_latte_light'
"else
  set background=dark
"  let g:airline_theme='cosmic_latte_dark'
"endif
colorscheme sonokai

"Airline
"let g:airline_powerline_fonts = 1 
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
":let g:airline_theme='murmur'

"Light Line
set showtabline=2
set guioptions-=e
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filename_modifier = ':p:.'
let g:lightline = {
  \ 'colorscheme': 'sonokai',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'enable': {
  \   'tabline': 1,
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
  \   'kanan': 'close',
  \ },
  \ 'tabline': {
  \   'left': [ [ 'buffers' ] ],
  \   'right': [ [ 'kanan' ] ],
  \ },
  \ 'separator': {
  \   'left': "\ue0b8 ",
  \   'right': "\ue0ba ",
  \ },
  \ 'subseparator': {
  \   'left': "\ue0b9 ",
  \   'right': '\ue0bb ',
  \ },
\ }
  " 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  " 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"let g:lightline#bufferline#unnamed = "[NO NAME]"
"let g:lightline#bufferline#filename_modifier= ":."
"let g:lightline#bufferline#more_buffers = "..."
"let g:lightline#bufferline#modified = " +"
"let g:lightline#bufferline#read_only = " -"
"let g:lightline#bufferline#shorten_path = 1
"let g:lightline#bufferline#show_number = 0

"fzf
"let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

"Signify
let g:signify_disable_by_default=0
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

"Golang
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
au FileType go nmap <leader>r <Plug>(go-run)

"Python
let g:python_highlight_all = 1

"Mapping
nmap     <C-K>     [e
nmap     <C-J>     ]e

nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <silent>  tk :bn<CR>
nnoremap <silent>  tj  :bp<CR>
nnoremap <silent>  tx  :bd<CR>

noremap <C-S>      :update<CR>
vnoremap <C-S>     <C-C>:update<CR><Esc>
inoremap <C-S>     <C-O>:update<CR><Esc>

noremap <C-Z>      :undo<CR>
vnoremap <C-Z>     <C-C>:undo<CR>
inoremap <C-Z>     <C-O>:undo<CR>

nmap <silent> <C-p> :call fzf#run(fzf#wrap({'source': 'fd --type f'}))<CR>

source $HOME/.config/nvim/coc.vim

