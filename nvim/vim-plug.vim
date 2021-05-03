filetype off                   " required!


call plug#begin('~/.vim/plugged')

" == Language support ==

" Ruby & Rails
" Improved Rails support
Plug 'tpope/vim-rails'
" Support for templates and CSS/JS
Plug 'slim-template/vim-slim'
" HAML + SASS
Plug 'tpope/vim-haml'

" Clojure
" Plug 'guns/vim-clojure-static'
" Plug 'tpope/vim-classpath'
Plug 'Olical/conjure'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-sexp'

" Elm
" Plug 'ElmCast/elm-vim'

" Rust
Plug 'rust-lang/rust.vim'

" == Syntax highlightning ==
" Dockerfile
" Plug 'ekalinin/Dockerfile.vim'

" == Insert support ==
" Edit reoccurring words at once as in sublime
" Plug 'terryma/vim-multiple-cursors'
" Insert and delete matching brackets and quotes
Plug 'Raimondi/delimitMate'
" Insert closing end after def, if etc
Plug 'tpope/vim-endwise'
" add/change/remove parantheses, brackets & more
Plug 'tpope/vim-surround'
" Add/removes comments
Plug 'tpope/vim-commentary'
" Makes plugin commands repeatable
Plug 'tpope/vim-repeat'

" == Other additions ==
" The solarized theme
Plug 'altercation/vim-colors-solarized'
" Use git inside of vim
Plug 'tpope/vim-fugitive'
" Linting
Plug 'dense-analysis/ale'
" Language server support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Show signs for git
Plug 'airblade/vim-gitgutter'
" File search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" New powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Airline theme
" Plug 'paranoida/vim-airlineish'

" All of your # Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
