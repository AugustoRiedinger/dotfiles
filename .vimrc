" Turn on syntax highlighting
syntax on

set mouse=a

" Show line numbers
set relativenumber 

" Show file stats
set ruler

" Turn off comments continuation:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable compatilibility with vi, which can cause unexpected errors:
set nocompatible

" Set tab size:
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Enable filetype detection:
filetype on

" Enable plugins and load plugins for detected files:
filetype plugin on

" Load an indent file for the detected file:
filetype indent on

" Do NOT wrap lines!!
" set nowrap

" Blink cursor on error instead of beeping (grr)
set visualbell

" Show partial command you type in the last line of the screen:
set showcmd

" Show the mode you are on the last line:
set showmode

" Enable auto completion menu after pressing TAB:
set wildmenu

" Make wildmenu behave like similar to Bash completion:
set wildmode=list:longest

" File to ignore in the wildmenu:
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Status bar
set laststatus=2

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:hybrid_termcolors=256
let g:hybrid_termtrans=1

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin(expand('~/.vim/plugged'))

"Plug 'arcticicestudio/nord-vim'

" Vimtex:
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips:
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"setlocal spell
"set spelllang=es,en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

Plug 'dylanaraps/wal'

call plug#end()
" " }}}

colorscheme wal
"colorscheme nord
