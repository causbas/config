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

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  vmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>aa  <Plug>(coc-codeaction)

  " Show symbols of current buffer
  nnoremap <silent> <Leader>ns  :<C-u>Denite coc-symbols<CR>

  nnoremap <Leader>qf :call CocAction("doQuickfix")<CR>
  nnoremap <Leader>ds :call CocAction("showSignatureHelp")<CR>
" }}}

" augroups {{{
" Setup formatexpr specified filetype(s).
let s:coc_filetypes_autocmd = 'autocmd FileType typescript,json,javascript,html,css'
augroup coc-group
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  execute s:coc_filetypes_autocmd 'nnoremap <buffer> <silent> K :call CocAction("doHover")<CR>'
  execute s:coc_filetypes_autocmd 'nnoremap <buffer> <silent> <C-]> :call CocAction("jumpDefinition", "edit")<CR>'
  execute s:coc_filetypes_autocmd 'nnoremap <buffer> <silent> <C-W><C-]> :call CocAction("jumpDefinition", "split")<CR>'
  execute s:coc_filetypes_autocmd 'nnoremap <buffer> <silent> <C-W>] :call CocAction("jumpDefinition", "split")<CR>'
  autocmd FileType typescript setlocal suffixesadd+=.js,.d.ts
  autocmd FileType typescript ALEDisableBuffer

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

	autocmd CursorHoldI,CursorMovedI * call CocAction('showSignatureHelp')
augroup END
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
