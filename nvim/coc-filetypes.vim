setlocal formatexpr=CocAction('formatSelected')

" mappings {{{
  " Remap keys for gotos
  nmap <buffer> <silent> <Leader>gd <Plug>(coc-definition)
  nmap <buffer> <silent> <Leader>gy <Plug>(coc-type-definition)
  nmap <buffer> <silent> <Leader>gi <Plug>(coc-implementation)
  nmap <buffer> <silent> <Leader>gr <Plug>(coc-references)

  " Remap for rename current word
  nmap <buffer> <Leader>rn <Plug>(coc-rename)

  " Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
  vmap <buffer> <Leader>a  <Plug>(coc-codeaction-selected)
  nmap <buffer> <Leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <buffer> <Leader>aa  <Plug>(coc-codeaction)

  " Show symbols of current buffer
  nnoremap <buffer> <silent> <Leader>no :CocList outline<CR>

  nnoremap <buffer> <Leader>qf :call CocAction("doQuickfix")<CR>
  nnoremap <buffer> <Leader>ds :call CocAction("showSignatureHelp")<CR>

  nmap <buffer> <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <buffer> <silent> ]d <Plug>(coc-diagnostic-next)

  nnoremap <buffer> <silent> K :call CocAction("doHover")<CR>
  nnoremap <buffer> <silent> <C-]> :call CocAction("jumpDefinition", "edit")<CR>
  nnoremap <buffer> <silent> <C-W><C-]> :call CocAction("jumpDefinition", "split")<CR>
  nnoremap <buffer> <silent> <C-W>] :call CocAction("jumpDefinition", "split")<CR>
" }}}

" augroups {{{
augroup coc-group
  autocmd!
  
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

	autocmd CursorHoldI,CursorMovedI * call CocActionAsync('showSignatureHelp')
augroup END
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
