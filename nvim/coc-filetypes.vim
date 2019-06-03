setlocal formatexpr=CocAction('formatSelected')

" mappings {{{
  nnoremap <silent> <Leader>nd :CocList diagnostics<CR>

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

  " snippets {{{
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
  " }}}
" }}}

" augroups {{{
augroup coc-group
  autocmd!
  
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
