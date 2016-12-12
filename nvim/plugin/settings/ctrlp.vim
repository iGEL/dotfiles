let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Default to filename searches - so that appctrl will find application
" controller
" let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,ja :CtrlP app<CR>
map ,jA :CtrlP app/assets<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jC :CtrlP config<CR>
map ,jd :CtrlP db<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jj :CtrlP app/assets/javascripts<CR>
map ,jl :CtrlP lib<CR>
map ,jm :CtrlP app/models<CR>
map ,jM :CtrlP app/mailers<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jS :CtrlP app/assets/stylesheets<CR>
map ,jv :CtrlP app/views<CR>
map ,jV :CtrlP vendor<CR>

" The top results seems to be better. Also, we want more results, so lets go
" with 30
let g:ctrlp_match_window='order:ttb,max:30'

if executable('rg')
  " Use rg (ripgrep) in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
