filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" == Language support ==
" Improved Rails support
Bundle 'tpope/vim-rails'
" Support for templates and CSS/JS
Bundle "slim-template/vim-slim"
Bundle 'kchmck/vim-coffee-script'
" HAML + SASS
Bundle 'tpope/vim-haml'

" == Insert support ==
" Edit reoccurring words at once as in sublime
Bundle "terryma/vim-multiple-cursors"
" Insert and delete matching brackets and quotes
Bundle "Raimondi/delimitMate"
" Insert closing end after def, if etc
Bundle "tpope/vim-endwise"
" Add/removes comments
Bundle "tomtom/tcomment_vim"

" == Other additions ==
" The solarized theme
Bundle 'altercation/vim-colors-solarized'
" Use git inside of vim
Bundle 'tpope/vim-fugitive'
" File search
Bundle "kien/ctrlp.vim"
" New powerline
Bundle 'bling/vim-airline'

" Airline theme
Bundle 'paranoida/vim-airlineish'
