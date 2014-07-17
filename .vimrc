" Copyright 2013 Stefan Istrate.
"
" Configure Vim with the following features:
"   --enable-cscope
"   --enable-gui=no
"   --enable-pythoninterp=yes
"   --enable-python3interp=yes
"   --with-features=huge

" General. {{{
set nocompatible  " Disable vi compatibility.
set history=1024  " Number of items to remember in history.
set clipboard=unnamed  " Copy to/from the system clipboard.
set undolevels=1000  " 1000 undos.
set updatecount=100  " Write the swap file to disk after typing 100 characters.

set hlsearch  " Highlight search.
set ignorecase  " Case insensitive matching.
set smartcase  " Be case sensitive when there's a capital letter.
set incsearch  " Show the match while typing.

set whichwrap+=<,>,[,]  " Left/right keys navigation.
set backspace=indent,eol,start  " More powerful backspacing.

syntax on  " Enable syntax.
" }}}

" Visual. {{{
set nowrap  " No text wrapping.
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

" Vundle plugins. {{{
filetype off  " Required!

set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Required!
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-jp/cpp-vim'
Plugin 'cscope.vim'
Plugin 'EasyGrep'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'

Plugin 'Lokaltog/powerline'
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim/
set laststatus=2  " Show the status line.

Plugin 'sudo.vim'

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1
let g:syntastic_cpp_cpplint_exec='cpplint'
let g:syntastic_cpp_checkers=['gcc', 'cpplint']
let g:syntastic_python_checkers=['pylint']

Plugin 'tComment'

Plugin 'altercation/vim-colors-solarized.git'
set background=dark
set t_Co=256

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'xolox/vim-misc'

Plugin 'xolox/vim-session'
let g:session_autoload='no'
let g:session_autosave='no'

if filereadable(expand('~/.at_google')) != 1  " Non-Google only.
  Plugin 'Valloric/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf=
      \ '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
  let g:ycm_register_as_syntastic_checker=0
  let g:ycm_autoclose_preview_window_after_completion=1
endif

call vundle#end()  " Required!
filetype plugin indent on  " Required! Detect file types.

colorscheme solarized  " Enable the solarized color scheme after vundle#end().
" }}}

" Commands. {{{
let mapleader=','

" Comment/Uncomment lines.
noremap <silent> <Leader>c :TComment<CR>
" Jump to the symbol definition / declaration.
nnoremap <silent> <Leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Toggle highlight search.
nnoremap <silent> <Leader>h :set hlsearch!<CR>
" Toggle paste mode.
nnoremap <silent> <Leader>p :set paste!<CR>
" Toggle spell checking.
nnoremap <silent> <Leader>s :set invspell<CR>
" Toggle NERDTree window.
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
" Open/Save the default session.
nnoremap <silent> <Leader><Leader>o :OpenSession default<CR>
nnoremap <silent> <Leader><Leader>s :SaveSession default<CR>
" }}}

" Local settings. {{{
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" }}}
