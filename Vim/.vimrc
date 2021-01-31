"Edit config
set expandtab
set softtabstop=4
set shiftwidth=4
set autochdir
set nobackup
set noswapfile
set nocompatible
"UI config
set number
set wrap
set linebreak
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
syntax on
set noshowmode
"Unicode config
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
"Keymap config
let mapleader = " "
inoremap jj <ESC>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <C-tab> :bn!<CR>
nnoremap <C-S-tab> :bp!<CR>
nnoremap <C-Q> :bp! \| bd!#<CR>
"Language config
set shortmess=atI
set langmenu=en_US.UTF-8
let $LANG= 'en_US.UTF-8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"Specified system config
if has('win32')
    set guifont=Cascadia\ Code\ PL:h10.5
    set guifontwide=新宋体:h10.5
endif
if has("gui_running")
    set lines=36 columns=160
endif
"Terminal config
set termwinsize=8x0
map <F1> :rightbelow terminal pwsh<CR>
call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ycm-core/YouCompleteMe', { 'do': 'python install.py --all' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'ryanoasis/vim-devicons'
call plug#end()
colorscheme dracula
"NERDTree config
let NERDTreeIgnore=['\c^ntuser\..*']
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
map <F2> :NERDTreeToggle %<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"AirLine config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"YCM config
set completeopt=menu,menuone
let g:ycm_max_num_candidates = 5
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
    \ }
