"------------------------------------------------------------
" ~/.vimrc 
"------------------------------------------------------------

set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'gerardo/vim-django-support'
Plugin 'powerline/fonts'
Plugin 'romainl/Apprentice'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin indent on
set encoding=utf-8

" vim-airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline#extenstions#tabline#enabled = 1
let g:airline#extenstions#tabline#show_buffers = 1
let g:airline_theme = 'bubblegum'

set t_Co=256
set laststatus=2

" Vimrc -- realpython.com :: VIM and Python - a match made in heaven
set splitbelow
set splitright

syntax on

" Split Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Indentation (2 tabs / Replace tabs with spaces / smart indent)
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Vim Timeout
set timeoutlen=10 ttimeoutlen=0

" Highlight Searches / Color
set hlsearch
hi Search gui=NONE ctermbg=DarkBlue ctermfg=Black guibg=#333333

" Identation Wizard CursorLine/CursorColumn Colors
hi CursorLine gui=NONE guibg=#CCCCCC
hi CursorColumn gui=NONE ctermbg=DarkBlue ctermfg=Black guibg=#333333

set wildmenu
set showcmd
set pastetoggle=<F11>

map Y y$
 
nnoremap <C-L> :nohl<CR><C-L>
 
" Toggle IndentWizard Mode
function! IndentWizardToggle()
  if(&cc == 81)
    set nocursorcolumn
    set nocursorline
    set cc=
    echo "Rest your mind..."
  elseif(!&cc)
    set cursorcolumn
    set cursorline
    set cc=101
    echom "May The Force be with your... Always"
  else
    set cursorcolumn
    set cursorline
    set cc=81
    echom "Your focus sharpens..."
  endif
endfunc

" Toggle Numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
    echom "Absolute Numbers"
  elseif(&number == 1)
    set nonumber
    set norelativenumber
    echom "No Numbers"
  else
    set number
    set relativenumber
    echom "Relative Numbers"
  endif
endfunc

" Trim Trailing Whitespace
function! TrimSpaces()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunc

" Set Apprentice Color Scheme
colorscheme apprentice

let mapleader=","

if $TERM =~ 'screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

if &diff
  highlight! link DiffText MatchParen
endif

nnoremap <C-i> :call IndentWizardToggle()<cr>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

set wmh=0
set wmw=0

map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;2D <S-Left>
map [1;2C <S-Right>
cmap [1;2D <S-Left>
cmap [1;2C <S-Right>

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists ("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set path+=**
