filetype off                   " required!


call plug#begin('~/.vim/plugged')

" == Language support ==

" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Copilot
Plug 'github/copilot.vim'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
" Snippet collection (Optional)
" Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

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
Plug 'shaunsingh/solarized.nvim'
" Use git inside of vim
Plug 'tpope/vim-fugitive'
" Linting
Plug 'dense-analysis/ale'
" Show signs for git
Plug 'airblade/vim-gitgutter'
" File search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
" New powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Airline theme
" Plug 'paranoida/vim-airlineish'

" All of your # Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
