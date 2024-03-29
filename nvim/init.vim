scriptencoding utf-8

"settings {{{
  filetype plugin indent on
  syntax enable
  let mapleader = ' '
  let g:airline_theme='molokai'
  set hidden
  set isfname+=@-@ " include '@' in filenames on lookup

  " case {{{
    set ignorecase
    set smartcase
  " }}}
  " backup / undo {{{
    set undofile
    set undolevels=10000
    augroup UndoFile
      autocmd!
      autocmd BufWritePre /tmp/* setlocal noundofile
    augroup END
    set noswapfile
  " }}}
  " indent {{{
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set linebreak
  " }}}
  " key timeout {{{
    set timeoutlen=500  " mapping timeout
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
    set clipboard+=unnamed,unnamedplus
    set title
    set noshowmode

    set inccommand=nosplit
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

    set matchpairs+=<:>
    set showmatch
    set matchtime=2

    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " color {{{
    let g:terminal_color_0  = '#2e3436'
    let g:terminal_color_1  = '#cc0000'
    let g:terminal_color_2  = '#4e9a06'
    let g:terminal_color_3  = '#c4a000'
    let g:terminal_color_4  = '#3465a4'
    let g:terminal_color_5  = '#75507b'
    let g:terminal_color_6  = '#0b939b'
    let g:terminal_color_7  = '#d3d7cf'
    let g:terminal_color_8  = '#555753'
    let g:terminal_color_9  = '#ef2929'
    let g:terminal_color_10 = '#8ae234'
    let g:terminal_color_11 = '#fce94f'
    let g:terminal_color_12 = '#729fcf'
    let g:terminal_color_13 = '#ad7fa8'
    let g:terminal_color_14 = '#00f5e9'
    let g:terminal_color_15 = '#eeeeec'
    " }}}
  " }}}
  " shell {{{
    set noshelltemp  " use pipes
    set shell=/bin/zsh
    if &shell =~? 'bash'
      set shellcmdflag+=\ -O\ globstar\ -O\ extglob
    endif
  " }}}
  " tools {{{
    " ripgrep
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
  " }}}
" }}}

" local config {{{
  let g:mysettings = {}
  let g:mysettings.completion_plugin = 'deoplete'

  let localConfig = '~/.myvimrc'
  if filereadable(expand(localConfig))
    execute 'source' expand(localConfig)
  endif
" }}}

" plugins {{{
  call plug#begin('~/.local/share/nvim/plugged')
   " completion {{{
    if g:mysettings.completion_plugin ==# 'deoplete' " {{{
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      let g:deoplete#enable_at_startup = 1
    " }}}
    elseif g:mysettings.completion_plugin ==# 'coc' " {{{
      Plug 'neoclide/coc.nvim', {'branch': 'release'}

      " Better display for messages
      set cmdheight=2

      augroup coc-filetypes
        autocmd!
        autocmd FileType typescript,json,javascript,html,css,yaml runtime coc-filetypes.vim
      augroup END

      nnoremap <Leader>nl :CocList lists<CR>
    endif " }}}
  " }}}
  " editing {{{
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-speeddating'
    Plug 'thinca/vim-visualstar'
    Plug 'terryma/vim-expand-region'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-unimpaired'
    Plug 'AndrewRadev/linediff.vim'
    Plug 'stefandtw/quickfix-reflector.vim'
  " }}}
  " javascript {{{
    Plug 'pangloss/vim-javascript'
  " }}}
  " typescript {{{
    Plug 'leafgarland/typescript-vim'
  " }}}
  " misc {{{
    Plug 'ryanoasis/vim-devicons'
    Plug 'qpkorr/vim-bufkill'
    Plug 'w0rp/ale' " {{{
      let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '✔︎']
      let g:ale_sign_error = '⨉'
      let g:ale_sign_warning = '⚠'
    " }}}
    Plug 'junegunn/fzf.vim' " {{{
      nnoremap <Leader>ff :Files<CR>
      nnoremap <Leader>bb :Buffers<CR>
      nnoremap <Leader>ww :Windows<CR>
      nnoremap <Leader>fr :History<CR>
      nnoremap <Leader>gf :GFiles?<CR>
      nnoremap <Leader>sh :History/<CR>
      nnoremap <M-;> :History:<CR>
      nnoremap <Leader>ss :execute 'Rg' expand('<cword>')<CR>
      vnoremap <Leader>ss y:Rg <C-R>"<CR>
      nnoremap <Leader>sf :execute 'BLines' expand('<cword>')<CR>
      vnoremap <Leader>sf y:BLines <C-R>"<CR>

      if isdirectory($HOME.'/.fzf')
        Plug '~/.fzf'
      endif
    " }}}
    Plug 'chrisbra/csv.vim' " {{{
      let g:csv_highlight_column = 'y'
      let g:no_csv_maps = '1'
    " }}}
  " }}}
  " textobj {{{
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-entire'
    Plug 'lucapette/vim-textobj-underscore'
  " }}}
  " scm {{{
  Plug 'mhinz/vim-signify' " {{{
      nnoremap <Leader>ghd :SignifyHunkDiff<CR>
      nnoremap <Leader>ghr :SignifyHunkUndo<CR>
  " }}}
  Plug 'tpope/vim-fugitive' " {{{
      nnoremap <Leader>gb :Git blame<CR>
    " }}}
  " }}}
  " ui {{{
    Plug 'doums/darcula'
    Plug 'machakann/vim-highlightedyank'
    Plug 'vim-airline/vim-airline' " {{{
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#fnamecollapse = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#fnametruncate = 12
      let g:airline_section_b = 0 " disable vcs info

      let g:airline_mode_map = {
          \ '__' : '-',
          \ 'c'  : 'C',
          \ 'i'  : 'I',
          \ 'ic' : 'I',
          \ 'ix' : 'I',
          \ 'n'  : 'N',
          \ 'ni' : 'N',
          \ 'no' : 'N',
          \ 'R'  : 'R',
          \ 'Rv' : 'R',
          \ 's'  : 'S',
          \ 'S'  : 'S',
          \ '' : 'S',
          \ 't'  : 'T',
          \ 'v'  : 'V',
          \ 'V'  : 'V',
          \ '' : 'V',
      \ }
    " }}}
    Plug 'vim-airline/vim-airline-themes'
    Plug 'milkypostman/vim-togglelist' " {{{
      let g:toggle_list_no_mappings = 1
    " }}}
    Plug 'nathanaelkane/vim-indent-guides' " {{{
      let g:indent_guides_start_level = 1
      let g:indent_guides_enable_on_vim_startup = 1
      let g:indent_guides_color_change_percent = 5
    " }}}
  " }}}
  call plug#end()

  colorscheme darcula
" }}}

" mappings {{{
  nnoremap <M-CR> o<Esc>
  nnoremap Y y$
  vnoremap > >gv
  vnoremap < <gv

  nnoremap <Leader>sg :silent grep <cword> <Bar> copen<CR>

  " add j/k to jumplist if > 1
  nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
  nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
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
    " toggle
    nnoremap <script> <silent> <leader>tl :call ToggleLocationList()<CR>
    nnoremap <script> <silent> <leader>tq :call ToggleQuickfixList()<CR>
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
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0
