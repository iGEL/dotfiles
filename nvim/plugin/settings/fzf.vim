let $FZF_DEFAULT_COMMAND = 'rg --files'

nnoremap <silent> <space>t :Files<CR>

" Additional mapping for buffer search
nnoremap <silent> <space>b :Buffers<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map <space>ja :Files app<CR>
map <space>jA :Files app/assets<CR>
map <space>jc :Files app/controllers<CR>
map <space>jC :Files config<CR>
map <space>jd :Files db<CR>
map <space>jh :Files app/helpers<CR>
map <space>jj :Files app/assets/javascripts<CR>
map <space>jl :Files lib<CR>
map <space>jm :Files app/models<CR>
map <space>jM :Files app/mailers<CR>
map <space>jp :Files public<CR>
map <space>js :Files spec<CR>
map <space>jS :Files app/assets/stylesheets<CR>
map <space>jv :Files app/views<CR>
map <space>jV :Files vendor<CR>
