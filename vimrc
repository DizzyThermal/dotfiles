"------------------------------------------------------------
" ~/.vimrc 
"------------------------------------------------------------

set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'

call vundle#end()

filetype plugin indent on
set encoding=utf-8

" Lightline
set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Vimrc -- realpython.com :: VIM and Python - a match made in heaven
set splitbelow
set splitright

syntax on

" Indentation (2 tabs / Replace tabs with spaces / smart indent)
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Vim Timeout
set timeoutlen=10 ttimeoutlen=0

" Highlight Searches / Color
colorscheme base16-default-dark

set hlsearch
hi Search gui=NONE ctermbg=DarkBlue ctermfg=Black guibg=#333333

" Identation Wizard CursorLine/CursorColumn Colors
hi CursorLine ctermbg=238 guibg=#444444
hi CursorColumn ctermfg=237 ctermbg=31 guifg=#3a3a3a guibg=#0087af
hi ColorColumn ctermfg=237 ctermbg=31 guifg=#3a3a3a guibg=#0087af

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

" Bindings / Mappings
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

set wmh=0
set wmw=0

map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;2D <S-Left>
map [1;2C <S-Right>
cmap [1;2D <S-Left>
cmap [1;2C <S-Right>

set path+=**
set wildmenu
set showcmd
set pastetoggle=<F11>

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set completeopt-=preview
