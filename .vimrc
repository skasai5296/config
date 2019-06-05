autocmd! bufwritepost .vimrc source %

set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

"         Settings for Vundle
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
Plugin 'git://git.wincent.com/command-t.git'
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

Plugin 'tomasiser/vim-code-dark'

"Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'

"Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd VimEnter * NERDTree
filetype plugin indent on
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

set t_Co=256
set t_BE=
colorscheme codedark

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
