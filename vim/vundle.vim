filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle "slim-template/vim-slim.git"

" Insert support
Bundle "terryma/vim-multiple-cursors"
Bundle "Raimondi/delimitMate"
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'Shougo/neocomplcache.vim'
Bundle "tomtom/tcomment_vim"

" Other additions
Bundle "kien/ctrlp.vim"

" Colors
Bundle "altercation/vim-colors-solarized"
