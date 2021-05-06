" ==============================================================================
" PLUGINS
" ==============================================================================
call plug#begin()
Plug 'Raimondi/delimitMate'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

" ==============================================================================
" COLORS
" ==============================================================================
set background=dark     " dark background
colorschem gruvbox      " gruvbox colorscheme
syntax enable           " syntax highlighting
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }


" ==============================================================================
" SPACES AND TABS
" ==============================================================================
set shiftwidth=3        " number of visual spaces per tab
set softtabstop=3       " number of spaces in tab
set expandtab           " tabs are spaces
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:indent_guides_enable_on_vim_startup=1  " indent guides upon vim startup
let g:indent_guides_start_level=1            " indent guides start at very left
let g:indent_guides_guide_size=1             " width of indent guides


" ==============================================================================
" UI CONFIG
" ==============================================================================
set number              " show line numbers
set showcmd             " show command in bottom bar
filetype plugin indent on      " loads indent files from ~/.vim/indent/<filetype>.vim
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set colorcolumn=85      " ruler at column 80


" ==============================================================================
" SEARCHING
" ==============================================================================
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" manually turn off search highilighting
nnoremap <leader><space> :nohlsearch<CR>


" ==============================================================================
" LEADER SHORTCUTS
" ==============================================================================
" leader is comma
let mapleader=","
" jj is escape
inoremap jj <esc>
" open NERDtree
map <C-n> :NERDTreeToggle<CR>
" switch between tabs using <Leader>+{Left|Right}
nnoremap <Leader><Left> :tabprevious<CR>
nnoremap <Leader><Right> :tabnext<CR>

" ==============================================================================
" ALIASES
" ==============================================================================
" abbreviate tabnew as tn only in command-line mode
cabbrev tn tabnew
