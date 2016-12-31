" Most here is lifted from https://github.com/skwp/dotfiles
set nocompatible                " choose no compatibility with legacy vi

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

if filereadable(expand("~/.config/nvim/vundle.vim"))
  source ~/.config/nvim/vundle.vim
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

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·


" Searching
set hlsearch                    " highlight matches
set incsearch                   " ... incrementally while typing
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ 9

  color solarized               " our color theme
  set guioptions-=m               "remove menu bar
  set guioptions-=T               "remove toolbar
endif

" Line numbering
set number                      " Show line numers

" Indentation

set autoindent
set smartindent
set smarttab

set wrap         "wrap lines

" No swap files
set noswapfile
set nobackup
set nowb

" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
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

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Colors
colorscheme solarized
set bg=light
" Highlight current line & column
set cul
set cuc
" It's slow, so don't do it during moving the cursor
au CursorHold,CursorHoldI * set cul | set cuc
au CursorMoved,CursorMovedI * if &cul | set nocul | set nocuc | endif

" Update stuff after 500ms
set updatetime=100

" Show effects of :s live, and show offscreen matches in a split window
set inccommand=split
