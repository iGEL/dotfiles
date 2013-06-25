" Most here is lifted from https://github.com/skwp/dotfiles
set nocompatible                " choose no compatibility with legacy vi

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

if filereadable(expand("~/.vim/vundle.vim"))
  source ~/.vim/vundle.vim
end

syntax on
set history=1000                " Keep alot of :cmdline history
set encoding=utf-8
set showcmd                     " display incomplete commands
set showmode                    " show current mode in the bottom
set gcr=a:blinkon0              " No cursor blinking
set visualbell                  " No sounds
set autoread                    " Reload files changed outside of vim
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " ... incrementally while typing
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ 9

  color solarized               " our color theme
  set bg=dark

endif

set number                      " Show line numers

set guioptions-=m               "remove menu bar
set guioptions-=T               "remove toolbar

set hidden                      " http://items.sjbach.com/319/configuring-vim-right

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" No swap files
set noswapfile
set nobackup
set nowb

" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Completion

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" Scrolling

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1