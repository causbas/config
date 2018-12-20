" functions {{{
" }}}

setlocal suffixesadd+=.js
" coc will do the linting
ALEDisableBuffer

" mappings {{{
" Use K for show documentation in preview window
nnoremap <buffer> <silent> K :call CocAction('doHover')<CR>
nmap <buffer> <silent> <C-]> <Plug>(coc-definition)
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
