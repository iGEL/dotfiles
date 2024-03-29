" Lifted from https://github.com/tpope/vim-sexp-mappings-for-regular-people/blob/7c3de2f13422fb4b62b4c34a660532c7b3d240c7/plugin/sexp_mappings_for_me.vim

if exists("g:loaded_sexp_mappings_for_me") || &cp
  finish
endif
let g:loaded_sexp_mappings_for_me = 1
let g:sexp_enable_insert_mode_mappings = 0

function! s:map_sexp_wrap(type, target, left, right, pos)
  execute (a:type ==# 'v' ? 'x' : 'n').'noremap'
        \ '<buffer><silent>' a:target ':<C-U>let b:sexp_count = v:count<Bar>exe "normal! m`"<Bar>'
        \ . 'call sexp#wrap("'.a:type.'", "'.a:left.'", "'.a:right.'", '.a:pos.', 0)'
        \ . '<Bar>silent! call repeat#set("'.a:target.'", v:count)<CR>'
endfunction

function! s:sexp_mappings() abort
  if !exists('g:sexp_loaded')
    return
  endif
  " call s:map_sexp_wrap('e', 'cseb', '(', ')', 0)
  " call s:map_sexp_wrap('e', 'cse(', '(', ')', 0)
  " call s:map_sexp_wrap('e', 'cse)', '(', ')', 1)
  " call s:map_sexp_wrap('e', 'cse[', '[', ']', 0)
  " call s:map_sexp_wrap('e', 'cse]', '[', ']', 1)
  " call s:map_sexp_wrap('e', 'cse{', '{', '}', 0)
  " call s:map_sexp_wrap('e', 'cse}', '{', '}', 1)

  " nmap <buffer> dsf <Plug>(sexp_splice_list)

  " if !get(g:, 'sexp_no_word_maps')
  "   nmap <buffer> B   <Plug>(sexp_move_to_prev_element_head)
  "   nmap <buffer> W   <Plug>(sexp_move_to_next_element_head)
  "   nmap <buffer> gE  <Plug>(sexp_move_to_prev_element_tail)
  "   nmap <buffer> E   <Plug>(sexp_move_to_next_element_tail)
  "   xmap <buffer> B   <Plug>(sexp_move_to_prev_element_head)
  "   xmap <buffer> W   <Plug>(sexp_move_to_next_element_head)
  "   xmap <buffer> gE  <Plug>(sexp_move_to_prev_element_tail)
  "   xmap <buffer> E   <Plug>(sexp_move_to_next_element_tail)
  "   omap <buffer> B   <Plug>(sexp_move_to_prev_element_head)
  "   omap <buffer> W   <Plug>(sexp_move_to_next_element_head)
  "   omap <buffer> gE  <Plug>(sexp_move_to_prev_element_tail)
  "   omap <buffer> E   <Plug>(sexp_move_to_next_element_tail)
  " endif

  " nmap <buffer> <I  <Plug>(sexp_insert_at_list_head)
  " nmap <buffer> >I  <Plug>(sexp_insert_at_list_tail)
  " nmap <buffer> <f  <Plug>(sexp_swap_list_backward)
  " nmap <buffer> >f  <Plug>(sexp_swap_list_forward)
  " nmap <buffer> <e  <Plug>(sexp_swap_element_backward)
  " nmap <buffer> >e  <Plug>(sexp_swap_element_forward)
  nmap <buffer> <localleader>kB  <Plug>(sexp_emit_head_element)
  nmap <buffer> <localleader>kb  <Plug>(sexp_emit_tail_element)
  nmap <buffer> <localleader>kS  <Plug>(sexp_capture_prev_element)
  nmap <buffer> <localleader>ks  <Plug>(sexp_capture_next_element)
  nmap <buffer> <localleader>kr  <Plug>(sexp_raise_element)
endfunction

function! s:setup() abort
  augroup sexp_mappings_for_me
    autocmd!
    execute 'autocmd FileType' get(g:, 'sexp_filetypes', 'lisp,scheme,clojure') 'call s:sexp_mappings()'
  augroup END
endfunction

if has('vim_starting') && !exists('g:sexp_loaded')
  au VimEnter * call s:setup()
else
  call s:setup()
endif
