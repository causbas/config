scriptencoding utf-8

" plugins {{{
  call plug#begin('~/.local/share/nvim/plugged')
  " completion {{{
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " {{{
      "let g:deoplete#enable_at_startup = 1
    "" }}}
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " {{{
      let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
      let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
    " }}}
    Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
  " }}}
  " editing {{{
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-speeddating'
    Plug 'thinca/vim-visualstar'
    Plug 'terryma/vim-expand-region'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'nathanaelkane/vim-indent-guides' " {{{
      let g:indent_guides_start_level = 1
      let g:indent_guides_enable_on_vim_startup = 1
      let g:indent_guides_color_change_percent = 5
    " }}}
  " }}}
  " typescript {{{
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  " }}}
  " misc {{{
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-scripts/bufkill.vim'
    Plug 'w0rp/ale' " {{{
      let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '✔︎']
      let g:ale_sign_error = '⨉'
      let g:ale_sign_warning = '⚠'
    " }}}
    Plug 'junegunn/fzf.vim'
  " }}}
  " textobj {{{
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-entire'
    Plug 'lucapette/vim-textobj-underscore'
  " }}}
  " ui {{{
    Plug 'isobit/vim-darcula-colors'
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-unimpaired'
    Plug 'machakann/vim-highlightedyank'
    Plug 'vim-airline/vim-airline' " {{{
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#fnamecollapse = 1
      let g:airline#extensions#tabline#enabled = 1
    " }}}
    Plug 'vim-airline/vim-airline-themes'
  " }}}
  call plug#end()
" }}}
" functions {{{
  " Highlight all instances of word under cursor, when idle.
  " Useful when studying strange source code.
  nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
  function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
      au! auto_highlight
      augroup! auto_highlight
      setl updatetime=4000
      " echo 'Highlight current word: off'
      return 0
    else
      augroup auto_highlight
        au!
        au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
      augroup end
      setl updatetime=20
      " echo 'Highlight current word: ON'
      return 1
    endif
  endfunction
" }}}
"settings {{{
  filetype plugin indent on
  syntax enable
  let mapleader = ' '
  colorscheme darcula
  let g:airline_theme='molokai'
  set noswapfile

  " indent {{{
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set linebreak
  " }}}

  " key timeout {{{
    set timeoutlen=300  " mapping timeout
    set ttimeoutlen=50  " keycode timeout
  " }}}

  " ui {{{
    set mouse=a  " enable mouse
    set number
    set relativenumber
    set virtualedit=block
    " command-line tab completion like in bash
    set wildmode=list:longest
    set wildignore+=*~,*.o,core.*,*.exe,.git/,.hg/,.svn/,.DS_Store,*.pyc
    set wildignore+=*.swp,*.swo,*.class,*.tags,tags,tags-*,cscope.*,*.taghl
    set wildignore+=.ropeproject/,__pycache__/,venv/,*.min.*,images/,img/,fonts/
    set wildignorecase
    " keep fold level when switching buffers
    set foldlevelstart=-1
    set clipboard+=unnamedplus
    set title
    set hidden
    set ignorecase
    set smartcase
    "call AutoHighlightToggle()
    set inccommand=nosplit

    set noshelltemp  " use pipes
    set foldmethod=syntax  " fold via syntax of files

    set scrolloff=10  " minimum number of lines above and below cursor
    set scrolljump=1  "minimum number of lines to scroll
    set sidescrolloff=5  " minimum number of columns to left and right of cursor
    set display+=lastline
    set cursorline
    augroup CursorLine
      autocmd!
      autocmd WinLeave * setlocal nocursorline
      autocmd WinEnter * setlocal cursorline
    augroup END
  " }}}

  " shell {{{
    set shell=/bin/zsh
    if &shell =~? 'bash'
      set shellcmdflag+=\ -O\ globstar\ -O\ extglob
    endif
  " }}}
" }}}
" mappings {{{
  nnoremap <M-CR> o<Esc>
  nnoremap Y y$
  vnoremap > >gv
  vnoremap < <gv
  nnoremap yo/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
  " windows {{{
    " focus
    nnoremap <M-h> <C-w>h
    nnoremap <M-j> <C-w>j
    nnoremap <M-k> <C-w>k
    nnoremap <M-l> <C-w>l
    " move
    nnoremap <M-H> <C-w>H
    nnoremap <M-J> <C-w>J
    nnoremap <M-K> <C-w>K
    nnoremap <M-L> <C-w>L
  " }}}
  " tools {{{
    " fzf
    nnoremap <Leader>ff :Files<CR>
    nnoremap <Leader>bb :Buffers<CR>
    nnoremap <Leader>fr :History<CR>
    nnoremap <Leader>gf :GFiles<CR>
    nnoremap <Leader>sh :History/<CR>
    nnoremap <M-;> :History:<CR>

    " ripgrep
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
  " }}}
" }}}
" terminal {{{
  " escape insert mode in terminal
  tnoremap <M-[> <C-\><C-n>
  " windowing
  tnoremap <M-h> <C-\><C-n><C-w>h
  tnoremap <M-j> <C-\><C-n><C-w>j
  tnoremap <M-k> <C-\><C-n><C-w>k
  tnoremap <M-l> <C-\><C-n><C-w>l
  tnoremap <M-H> <C-\><C-n><C-w>Hi
  tnoremap <M-J> <C-\><C-n><C-w>Ji
  tnoremap <M-K> <C-\><C-n><C-w>Ki
  tnoremap <M-L> <C-\><C-n><C-w>Li
  tnoremap <M-CR> <C-\><C-n>:terminal<CR>
  " scrolling
  tnoremap <S-PageUp> <C-\><C-n><PageUp>
  tnoremap <S-PageDown> <C-\><C-n><PageDown>
  " env variable can be accessed in shell scripts
  let $IN_NEOVIM = 'true'
  set termguicolors
  set scrollback=100000
  highlight Cursorline guifg=NONE
  " workaround for neovim issue 4151
  let $FZF_DEFAULT_OPTS .= ' --no-height'

  augroup Terminal
    autocmd!
    " fix for terminal disabling relativenumber
    autocmd TermOpen *  :set relativenumber
  augroup END
" }}}
" augroups {{{
  " will prevent help window from opening if buffer list is empty
  "augroup QuitAfterDeletingLastBuffer
    "autocmd!
    "autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | qall | endif
  "augroup END

  augroup ChangeWorkingDirectoryWhenEnteringBuffer
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
  augroup END
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0