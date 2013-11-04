"""
""" Author: Stefan Istrate
"""

""" General {{{
set nocompatible " Disable vi compatibility.
set history=1024 " Number of items to remember in history.
set clipboard=unnamedplus " Copy to/from the system clipboard.

set hlsearch " Highlight search.
set ignorecase " Case insensitive matching.
set smartcase " Be case sensitive when there's a capital letter.
set incsearch " Show the match while typing.
""" }}}

""" Formatting {{{
set nowrap
set whichwrap+=<,>,h,l " Left/right keys navigation.
set backspace=indent,eol,start " More powerful backspacing.

set tabstop=2 " The default tabstop.
set softtabstop=2
set shiftwidth=2 " The default shift width for indents.
set expandtab " Make tabs into spaces.
set smarttab " Smarter tab levels.

set autoindent
set cindent

syntax on " Enable syntax.
filetype plugin indent on " Detect file types.
""" }}}

""" Visual {{{
set number " Enable line numbers.
set ruler " Show ruler.
set title " Let vim set the title of the window.
set cursorline " Highlight the current line.
set colorcolumn=81 " Highlight the length limit of code lines.
set scrolloff=3 " Show some context before and after the cursor.
set showmatch " Show matching brackets.

set nolist " Display unprintable characters.
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars.

set foldenable " Enable folding.
set foldmethod=indent " Indent folding.
set foldcolumn=5
set foldlevel=1

set mouse=a " Enable mouse.

set splitbelow
set splitright
""" }}}

""" Commands {{{
let mapleader = ','
""" }}}

""" Vundle plugins {{{
filetype off " Required!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Required!
Bundle 'gmarik/vundle'

Bundle 'cscope.vim'
Bundle 'EasyGrep'
Bundle 'FuzzyFinder'
Bundle 'gsearch'
Bundle 'L9'
Bundle 'Valloric/MatchTagAlways'

Bundle 'scrooloose/nerdtree'
autocmd vimenter * NERDTree

Bundle 'Lokaltog/powerline'
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim/
set laststatus=2 " Show the status line.

Bundle 'sudo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tComment'

Bundle 'altercation/vim-colors-solarized.git'
set background=dark
set t_Co=256
colorscheme solarized

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'

Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf=
  \ '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

filetype plugin indent on " Required!
""" }}}
