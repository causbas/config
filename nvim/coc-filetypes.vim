setlocal formatexpr=CocAction('formatSelected')

" mappings {{{
  nnoremap <silent> <Leader>nd :CocList diagnostics<CR>

  " Remap keys for gotos
  nmap <buffer> <silent> <Leader>gd <Plug>(coc-definition)
  nmap <buffer> <silent> <Leader>gy <Plug>(coc-type-definition)
  nmap <buffer> <silent> <Leader>gi <Plug>(coc-implementation)
  nmap <buffer> <silent> <Leader>gr <Plug>(coc-references)

  " Remap for rename current word
  nmap <buffer> <silent> <Leader>rn <Plug>(coc-rename)
  nmap <buffer> <silent> <Leader>rf <Plug>(coc-refactor)

  " Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
  xmap <buffer> <silent> <Leader>a  <Plug>(coc-codeaction-selected)
  nmap <buffer> <silent> <Leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <buffer> <silent> <Leader>aa  <Plug>(coc-codeaction-line)

  nnoremap <buffer> <silent> <Leader>no :CocList outline<CR>
  nnoremap <buffer> <silent> <Leader>ns :CocList --interactive symbols<CR>

  nnoremap <buffer> <silent> <Leader>qf :call CocAction("doQuickfix")<CR>
  nnoremap <buffer> <silent> <Leader>ds :call CocAction("showSignatureHelp")<CR>

  nmap <buffer> <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <buffer> <silent> ]d <Plug>(coc-diagnostic-next)

  nnoremap <buffer> <silent> K :call CocAction("doHover")<CR>
  nnoremap <buffer> <silent> <C-]> :call CocAction("jumpDefinition", "edit")<CR>
  nnoremap <buffer> <silent> <C-W><C-]> :call CocAction("jumpDefinition", "split")<CR>
  nnoremap <buffer> <silent> <C-W>] :call CocAction("jumpDefinition", "split")<CR>

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " snippets {{{
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    xmap <C-j> <Plug>(coc-snippets-select)

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

  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
