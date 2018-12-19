" settings {{{
  " Better display for messages
  set cmdheight=2

  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300

  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" }}}

" mappings {{{
  " Remap keys for gotos
  nmap <silent> <Leader>gd <Plug>(coc-definition)
  nmap <silent> <Leader>gy <Plug>(coc-type-definition)
  nmap <silent> <Leader>gi <Plug>(coc-implementation)
  nmap <silent> <Leader>gr <Plug>(coc-references)

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  vmap <leader>xf  <Plug>(coc-format-selected)
  nmap <leader>xf  <Plug>(coc-format-selected)

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  vmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>aa  <Plug>(coc-codeaction)

  " Show symbols of current buffer
  nnoremap <silent> <space>ns  :<C-u>Denite coc-symbols<cr>
" }}}

" augroups {{{
" Setup formatexpr specified filetype(s).
augroup coc-group
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

	autocmd CursorHoldI,CursorMovedI * call CocAction('showSignatureHelp')
augroup END
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
