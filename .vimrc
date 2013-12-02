" Copyright 2013 Stefan Istrate.

" General. {{{
set nocompatible  " Disable vi compatibility.
set history=1024  " Number of items to remember in history.
set clipboard=unnamedplus  " Copy to/from the system clipboard.
set undolevels=1000  " 1000 undos.
set updatecount=100  " Write the swap file to disk after typing 100 characters.

set hlsearch  " Highlight search.
set ignorecase  " Case insensitive matching.
set smartcase  " Be case sensitive when there's a capital letter.
set incsearch  " Show the match while typing.
" }}}

" Formatting. {{{
set nowrap
set whichwrap+=<,>,[,]  " Left/right keys navigation.
set backspace=indent,eol,start  " More powerful backspacing.

set tabstop=2  " The default tabstop.
set softtabstop=2
set shiftwidth=2  " The default shift width for indents.
set expandtab  " Make tabs into spaces.
set smarttab  " Smarter tab levels.

set autoindent
set cindent

syntax on  " Enable syntax.
filetype plugin indent on  " Detect file types.
" }}}

" Visual. {{{
set number  " Enable line numbers.
set ruler  " Show ruler.
set title  " Let vim set the title of the window.
set cursorline  " Highlight the current line.
set colorcolumn=81  " Highlight the length limit of code lines.
set scrolloff=3  " Show context before/after the cursor.
set sidescrolloff=7  " Show context to the left/right of the cursor.
set sidescroll=1  " Scroll horizontally 1 position at a time.
set showmatch  " Show matching brackets.

set list  " Display unprintable characters.
set listchars=tab:·\ ,trail:·,extends:»,precedes:«  " Unprintable chars.

set foldenable  " Enable folding.
set foldmethod=syntax  " Syntax based folding.
set foldnestmax=4  " Maximum nesting of folds.
set foldcolumn=5
autocmd Syntax * normal zR

set mouse=a  " Enable mouse.

set splitbelow
set splitright

set wildmenu  " Enable better command completion.
set wildmode=list:longest

set lazyredraw
" }}}

" Commands. {{{
let mapleader = ','
" }}}

" Vundle plugins. {{{
filetype off  " Required!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Required!
Bundle 'gmarik/vundle'

Bundle 'vim-jp/cpp-vim'
Bundle 'cscope.vim'
Bundle 'EasyGrep'
Bundle 'FuzzyFinder'
Bundle 'gsearch'
Bundle 'L9'
Bundle 'Valloric/MatchTagAlways'

Bundle 'scrooloose/nerdtree'
autocmd vimenter * if !argc() | NERDTree | endif

Bundle 'Lokaltog/powerline'
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim/
set laststatus=2  " Show the status line.

Bundle 'sudo.vim'

Bundle 'scrooloose/syntastic'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers=['cpplint']
let g:syntastic_python_checkers=['pylint']

Bundle 'tComment'

Bundle 'altercation/vim-colors-solarized.git'
set background=dark
set t_Co=256
colorscheme solarized

Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'

if filereadable(expand('~/.at_google')) != 1  " Non-Google only.
  Bundle 'Valloric/YouCompleteMe'
  let g:ycm_register_as_syntastic_checker = 0
  let g:ycm_global_ycm_extra_conf=
      \ '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
endif

filetype plugin indent on  " Required!
" }}}

" Local settings. {{{
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" }}}
