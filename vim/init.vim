" *
" Created by 1478zhcy on January 13, 2021.
" The purpose of writing this configuration
" file is to unify the experience of using
" Vim and Neovim on different platforms
" according to my personal preferences.
" *

"Edit config
set expandtab
set softtabstop=4
set shiftwidth=4
set autochdir
set nobackup
set noswapfile
set nocompatible

"UI config
syntax on
set number
set wrap
set linebreak
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
set noshowmode
if has('win32')
    set guifont=Cascadia\ Code\ PL:h10.5
    set guifontwide=新宋体:h10.5
endif

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
nnoremap <C-Q> :bp! \| bd!#<CR>
if has("gui_running")
    nnoremap <C-tab> :bn!<CR>
    nnoremap <C-S-tab> :bp!<CR>
else
    nnoremap <C-X> :bn!<CR>
    nnoremap <C-Z> :bp!<CR>
endif

"Language config
set shortmess=atI
set langmenu=en_US.UTF-8
let $LANG= 'en_US.UTF-8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Terminal config
if !has('nvim')
    set termwinsize=8x0
endif
map <F1> :rightbelow terminal pwsh<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
call plug#end()

colorscheme dracula

"AirLine config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"NERDTree config
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
map <F2> :NERDTreeToggle %<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"CoC config
"    Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"    Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"    Formatting selected code.
xmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>f <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
"    Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"    Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"    Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
"    Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"    Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_global_extensions = [
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-java',
    \ 'coc-pyright',
    \ 'coc-jedi',
    \ 'coc-html'
    \]
