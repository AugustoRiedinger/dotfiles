
" ----------------------- DEPENDECIES -----------------------

" nodejs
" code-minimap

" --------------------  GENERAL SETTINGS  -------------------
" Set compatibility to Vim only.
set nocompatible
set nolist
set rnu

" Turn off comments continuation:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Helps force plug-ins to load correctly when it is turned back on below.
filetype on

" Show partial command you type in the last line of the screen:
set showcmd

" Enable auto completion menu after pressing TAB:
set wildmenu

" Add color to files with no extention:
au BufNewFile,BufRead * if &syntax == '' | set syntax=c | endif

" Make wildmenu behave like similar to Bash completion:
set wildmode=list:longest

" Turn on syntax highlighting.
syntax on

" Set mouse available:
set mouse=a

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers
set number


" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" --------------------  NAVIGATION -------------------
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Misc
:imap ii <Esc>

" Search shortcuts
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>
noremap <leader><cr> <cr><c-w>h:q<cr>
nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> 

" Copy and pasting:
vnoremap <C-c> "+y
map <C-v> "+p

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" --------------------  PLUGINS  -------------------

" Plugin autoinstalling:
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin plugins:
call plug#begin(expand('~/.vim/plugged'))
" Interface and theming:
Plug 'dylanaraps/wal'
" End plugins:
call plug#end()

" --------------------  PLUGINS CONFIG -------------------
" Set colorscheme:
colorscheme wal
set t_Co=256
set background=dark
let g:hybrid_termcolors=256
let g:hybrid_termtrans=1
