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
set ignorecase
set nocompatible
set clipboard=unnamedplus
set shortmess+=c

"UI config
syntax on
set number
set wrap
set linebreak
set hlsearch
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
set noshowmode
set wildmenu
set title
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
if !has('nvim')
    set cursorline
    set cursorlineopt=number
"    let &t_SI.="\e[5 q"
"    let &t_SR.="\e[4 q"
"    let &t_EI.="\e[1 q"
endif
if has('win32')
    set guifont=Cascadia\ Code\ PL:h10.5
    if !has('nvim')
        set guifontwide=黑体:h10.5
    else
        set guifontwide=思源雅黑:h11
    endif
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
    map <F1> :rightbelow terminal pwsh<CR>
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme dracula

"Startify config
let g:startify_custom_header = [
    \' ╭───────────────────────────────────────────────╮ ',
    \' │                                               │ ',
    \' │    ███     ███  ████      ███       ███       │ ',
    \' │   ░░██    ░██  ░░██      ██░██    ░██░██      │ ',
    \' │    ░██    ░██   ░██     ░██░██    ░██░██      │ ',
    \' │    ░░██   ██    ░██     ██ ░░██   ██ ░░██     │ ',
    \' │     ░██  ░██    ░██    ░██  ░██  ░██  ░██     │ ',
    \' │     ░░██ ██     ░██    ██   ░░██ ██   ░░██    │ ',
    \' │      ░██░██     ░██   ░██    ░██░██    ░██    │ ',
    \' │      ░░███      ████  ████   ░░███     ████   │ ',
    \' │       ░░░      ░░░   ░░░░     ░░░     ░░░░    │ ',
    \' │                  Customized By Zhang Caiyi.   │ ',
    \' ╰───────────────────────────────────────────────╯ ',
    \]
let g:startify_files_number = 5
let g:startify_session_autoload = 1

"AirLine config
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"NERDTree config
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
map <Leader>e :NERDTreeToggle %<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \}

"FZF config
nnoremap <Leader>f :FZF<CR>

"VimTeX config
set conceallevel=1
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
if has('unix')
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_toc_config = {
\ 'name' : 'TOC',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\}

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
"    Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
"    Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
"     GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
"    Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"    Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
"    Formatting selected code.
xmap <Leader>F <Plug>(coc-format-selected)<CR>
nmap <Leader>F <Plug>(coc-format-selected)<CR>
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
    \ 'coc-highlight',
    \ 'coc-fzf-preview',
    \ 'coc-spell-checker',
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-java',
    \ 'coc-pyright',
    \ 'coc-html',
    \ 'coc-phpls',
    \ 'coc-prettier',
    \ 'coc-rust-analyzer',
    \ 'coc-vimtex'
    \]
