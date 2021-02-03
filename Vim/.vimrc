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
    nnoremap <C-tab> :bn!<CR>
    nnoremap <C-S-tab> :bp!<CR>
else
    nnoremap <C-X> :bn!<CR>
    nnoremap <C-Z> :bp!<CR>
endif

"Terminal config
set termwinsize=8x0
map <F1> :rightbelow terminal pwsh<CR>

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'puremourning/vimspector'
"Plug 'ryanoasis/vim-devicons'
"Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme dracula

"NERDTree config
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
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#whitespace#symbol = '!'

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
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
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
"let g:coc_user_config[''] = v:true
