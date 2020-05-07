autocmd! bufwritepost .vimrc source %

set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

" Settings for Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tomasr/molokai'

"Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'dense-analysis/ale'
" ale linter configurations
let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
let g:ale_linters = {
    \   'python': ['flake8', 'mypy', 'pylint'],
    \ }
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = g:python3_host_prog
let g:ale_python_pylint_options = '-m pylint'
let g:ale_python_mypy_executable = g:python3_host_prog
let g:ale_python_mypy_options = '-m mypy'

" ale fixer configurations
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'python': ['autopep8', 'black', 'isort'],
    \ }
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black -l 79'
let g:ale_fix_on_save = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax enable                                 " enable syntax processing
set cindent
" autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
filetype on
augroup fileTypeIndent
    autocmd!
    autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd Filetype c,cpp,java setlocal cindent
    autocmd Filetype yaml,ruby,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd VimEnter * NERDTree
set omnifunc=syntaxcomplete#Complete

set number                                    " number lines
set cursorline                                " different bg color for current line
set ambiwidth=double                          " set unknown letters to width 2
set list                                      " visualize invisible chars
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal                          " do not make numbers that start with 0 octal
set history=50                                " save 50 lines in command line history
set virtualedit=block                         " allow block choice in virtual mode
set backspace=2                               " make backspace available anywhere
set wildmenu                                  " set autocompletion available
set wildmode=longest:full,full                " first tab longest match, rest goes through
set showmatch                                 " show parentheses match

set hidden                                    " allow other file editing
set autoread                                  " refresh files automatically
set nobackup                                  " no backup files during save
set noswapfile                                " no swap files during edit

" Ctrl-c to copy selected text to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
map ; :Files<CR>
map <C-o> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-x> :tabc<CR>

if &term =~# '256color' && ( &term =~# '^screen' || &term =~# '^tmux' )
    set termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
set t_BE=
colorscheme molokai
let g:molokai_original = 1
