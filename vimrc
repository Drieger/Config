" ========================================================= "
" Initial configuration
" Download vim-plug (https://github.com/junegunn/vim-plug)
" It requires `curl` to be installed
" ========================================================= "

  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

" ========================================================= "
" Observations:
" ========================================================= "
" - Tweak Ubuntu (sudo apt install gnome-tweaks)
" - Terminal Themes (https://mayccoll.github.io/Gogh/#0)

" ========================================================= "
" Set leader key as <Space>
" It must be done before any usage or it won't be effective
" ========================================================= "
"
  let mapleader = "\<Space>"

" ========================================================= "
" Plugin configuration
" We are using vim-plug to manage our plugins
" [o] Fugitive (Git integration)
" [o] Surround
" [o] YouCompleteMe
" [o] Fzf (Fuzzy Finder)
" [o] Nerdtree
" [o] Gruvbox theme
" [o] Airline
" [o] Add multi-cursor
" [o] Emmet
" [o] Snippets
" [o] Linters
" [o] Commenter
" [o] Auto-close
" [o] Tags
" ========================================================= "

  call plug#begin('~/.vim/plugged')


" Git integration
  Plug 'tpope/vim-fugitive'
" {{{
" No extra configuration
" }}}


" Make it easier to surround things
  Plug 'tpope/vim-surround'
" {{{
" No extra configuration
" }}}


" Better autocomplete
" Supported languages: c-family, python2/python3, javascript/typescript
  Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --ts-completer' }
" {{{
  let g:ycm_autoclose_preview_window_after_completion = 1
" }}}


" Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
" {{{
" Smaller split size
  let g:fzf_layout = {'window': '10split enew'}

" Use ag as default and .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Use <C-p> to search files path
  nnoremap <silent> <C-p> :FZF<cr>

" Use <C-f> to search in files
  nnoremap <silent> <C-f> :Ag <cr>
" }}}


" Nerdtree
  Plug 'scrooloose/nerdtree'
" {{{
" Open NERDTree when vim starts in a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if the only window left open in NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable numbers on NERDTree buffers
  let g:NERDTreeShowLineNumbers=0

" Map a key to toggle NERDTree avoid conflict with multiple cursors
  map <C-t> :NERDTreeToggle <CR>
" }}}


" Gruvbox theme for a better experience
  Plug 'morhetz/gruvbox'
" {{{
" Enables italic text
  let g:gruvbox_italic = 1
" Make dark mode contrast harder
  let g:gruvbox_contrast_dark = "hard"
" }}}


" Airline and airline themes
" Gruvbox contains its own airline theme. Additional package is not
" necessary.
  Plug 'vim-airline/vim-airline'
" {{{
  let g:airline_theme = 'gruvbox'
" }}}

" Multiple-cursors support
  Plug 'terryma/vim-multiple-cursors'
" {{{
" No extra configuration
" }}}


" Emmet
" User <C-y>, to expand
  Plug 'mattn/emmet-vim'
" {{{
" Add emmet only for html/css
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
" }}}


"Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" {{{
" Set key to expand snippet
  let g:UltiSnipsExpandTrigger="<C-e>"
" }}}


"Linters
  Plug 'neomake/neomake'
" {{{
" Open list automatically
  let g:neomake_open_list = 2
" }}}


" Commenter
  Plug 'scrooloose/nerdcommenter'
" {{{
  let g:NERDSpaceDelims = 1
" }}}


" Auto-close
" Use delimitMate to avoid conflict with YouCompleteMe
Plug 'raimondi/delimitmate'
" {{{
" No extra configuration
" }}}


" Tags
Plug 'universal-ctags/ctags'
" {{{
" No extra configuration
" }}}


" End plugin configuration
  call plug#end()

" ========================================================= "
" Interface configuration
" [o] Show line numbers (hybrid with absolute and relative)
" [o] Highlight search
" [o] No lime wrap
" [o] Add true color terminal support
" [o] Dark background
" [o] Show tabs and whitespaces
" [o] Show line, column on status line
" [o] Show statusline
" [o] Syntax colors
" [o] Better colorscheme
" ========================================================= "

  set number relativenumber
  set hls
  set nowrap
  set termguicolors
  set background=dark
  set list listchars=tab:→\ ,trail:¬
  set ruler
  set laststatus=2
  syntax on
  colorscheme gruvbox

" ========================================================= "
" Usability configuration
" [o] Incremental search
" [o] Ignorecase and smartcase
" [o] Use spaces instead of tabs
" [o] TabSize=2, ShiftWidth=2, AutoIndent, SmartIndent
" [o] Normal usage of backspace
" [o] Encode files as utf-8
" [o] Vertical split on the right
" [o] Horizontal split below
" [o] Show uncomplete commands
" [o] Allow filetype specific plugins
" ========================================================= "

  set incsearch
  set ignorecase
  set smartcase
  set expandtab
  set ts=2 sw=2 ai si
  set backspace=2
  set encoding=utf-8
  set splitright
  set splitbelow
  set showcmd
  filetype plugin on

" ========================================================= "
" Use VIm right configuration
" [o] Disable arrow keys (up, right, down, left) in normal
" ========================================================= "

  nnoremap <Up>    :echoe "Key is disabled, use k"<CR>
  nnoremap <Right> :echoe "Key is disabled, use l"<CR>
  nnoremap <Down>  :echoe "Key is disabled, use j"<CR>
  nnoremap <Left>  :echoe "Key is disabled, use h"<CR>

" ========================================================= "
" Performance configuration
" [o] No backups
" [o] Lazy redraw
" ========================================================= "

  set noswapfile
  set nobackup
  set nowb
  set lazyredraw

" ========================================================= "
" Utils configuration
" [o] Remove trailing spaces when saving a file
" [o] Auto reload .vimrc
" [o] Relative numbers on current buffer or insert mode
" [o] Run linter when writing a buffer
" ========================================================= "

" {{{
" Remove trailing whitespaces
  autocmd BufWritePre * :%s/\s\+$//e
" }}}

" {{{
" Auto reload .vimrc
  autocmd BufWritePost .vimrc source %
" }}}

" {{{
" Relative numbers on current buffer or insert mode
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    autocmd BufEnter,BufLeave NERD_* set nonumber norelativenumber
  augroup END
" }}}

" {{{
" Run linter when writing a buffer
  call neomake#configure#automake('w')
" }}}

" ========================================================= "
" Key binds and maps configuraton
"
" [o] Save file → <Ctrl+s> (Added "stty -ixon" in .bashrc)
" [o] Maximize window → <Ctrl+w><Ctrl+o>
" ========================================================= "
"
" {{{
" Save file using Ctrl+s
  inoremap <C-s> <Esc>:w<Cr>a
  nnoremap <C-s> <Esc>:w<Cr>
  vnoremap <C-s> <Esc>:w<Cr>gv
" }}}

" {{{
" Maximize window
" http://vim.wikia.com/wiki/Maximize_window_and_return_to_previous_split_structure
  function! MaximizeToggle()
    if exists("s:maximize_session")
      exec "source " . s:maximize_session
      call delete(s:maximize_session)
      unlet s:maximize_session
      let &hidden=s:maximize_hidden_save
      unlet s:maximize_hidden_save
    else
      let s:maximize_hidden_save = &hidden
      let s:maximize_session = tempname()
      set hidden
      exec "mksession! " . s:maximize_session
      only
    endif
  endfunction

  nnoremap <C-W><C-O> <Esc>:call MaximizeToggle()<Cr>
  inoremap <C-W><C-O> <Esc>:call MaximizeToggle()<Cr>a
  vnoremap <C-W><C-O> <Esc>:call MaximizeToggle()<Cr>gv
" }}}
