call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'unblevable/quick-scope'
Plug 'morhetz/gruvbox'
call plug#end()

" Plug 'joshdick/onedark.vim'
set nocompatible
" let g:auto_save = 1
set encoding=UTF-8
" colorscheme onedark
colorscheme molokai
" colorscheme gruvbox
set background=dark
syntax on
set incsearch
" set mouse=a
set exrc "auto source .vimrc file
" set colorcolumn=80
set termguicolors
" set nowrap
" the two have to be togther to work
set ignorecase
set smartcase
set scrolloff=10
set hlsearch
set showcmd
set ruler
set number
set noswapfile
set nobackup
filetype indent on
filetype plugin on
set autoindent
set cursorline
let mapleader = " "
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
autocmd BufWrite * call CocAction('format')
if executable('rg')
   let g:rg_derive_root='true'
endif
hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi Title ctermfg=LightBlue ctermbg=Magenta
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
"config for indent
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

set tabstop=4
" config for quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't','T']

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" config for airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 2

noremap <F9> :vertical resize +10<CR>
noremap <F8> :vertical resize -10<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap <leader>b :Buffers<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <leader>/ :Rg<Cr>
" config for fzf
let g:fzf_layout = {'down':'40%'}
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>
" config for mapping tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" config for mapping pane switch
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"config for rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" configure cursor
if &term =~ "xterm\\|rxvt"
   " use an orange cursor in insert mode
   silent! let &t_SI = "\e[5 q\e]12;orange\x7"
   " use a red cursor in replace mode
   silent! let &t_SR = "\e[3 q\e]12;red\x7"
   " use a green cursor otherwise
   silent! let &t_EI = "\e[2 q\e]12;green\x7"
   silent !echo -ne "\033]12;green\007"
endi

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
