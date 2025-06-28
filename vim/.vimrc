" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

imap jj <Esc>

syntax on             " Turn on syntax highlighting
set background=dark   " Dark background
set number            " Show line numbers
set ruler             " Show file stats
set noerrorbells
set showmode

" Security
set modelines=0

" Encoding
set encoding=utf-8

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent
set expandtab
set noshiftround

" Searching
set hlsearch
set incsearch
set showmatch
set smartcase

" Store viminfo in XDG-compliant location
if exists('$XDG_STATE_HOME')
  set viminfofile=$XDG_STATE_HOME/vim/viminfo
else
  set viminfofile=$HOME/.viminfo
endif

