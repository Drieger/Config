"""""""""""""""""""""""""""""
"** Autoreload config file **
"""""""""""""""""""""""""""""
augroup vimrc " {
  autocmd!
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END " }

"""""""""""""""""""""""
"** Plugins settings **
"""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

  " Linter
  Plug 'neomake/neomake'

  " Treeview
  Plug 'scrooloose/nerdtree'

  " Autocomplete
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-jedi'

  " White space handler
  Plug 'ntpeters/vim-better-whitespace'

  " Surrounder
  Plug 'tpope/vim-surround'

  " Colorscheme
  Plug 'bluz71/vim-moonfly-colors'

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Procvim
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}

  " Emmet
  Plug 'mattn/emmet-vim'

  " Typescript
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/tsuquyomi'

call plug#end()

""""""""""""""""""""""
"** Editor settings **
""""""""""""""""""""""
set ruler
set number
set nowrap
set hlsearch
set incsearch
set smartcase
set ignorecase
set cursorline
set smarttab
set expandtab
set expandtab ts=2 sw=2 ai si
set lazyredraw
set nowb
set noswapfile
set nobackup
syntax on

""""""""""""""""""""""
"** Keymap settings **
""""""""""""""""""""""

" Leader key
let mapleader=','

" Open fuzzy finder
map <Leader>p :FZF<CR>

" Toggle treeview
map <C-\> :NERDTreeToggle<CR>

" Use tab to expand emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"""""""""""""""""""""""""""
"** Autocommand settings **
"""""""""""""""""""""""""""

" Strip whitespace before buffer save
autocmd BufEnter * EnableStripWhitespaceOnSave
autocmd BufWritePost * Neomake

" Set syntax for .kid files
autocmd BufNewFile,BufRead *.kid set syntax=html

""""""""""""""""""""""""""""""""""""
"** Plugin configuration settings **
""""""""""""""""""""""""""""""""""""

" Fuzzy finder
let g:fzf_layout = { 'down': '~25%' }

" Whitespace

"""""""""""""""""""""
"** Linter settings **
"""""""""""""""""""""
let g:neomake_python_enabled_makers = ['flake8']
let g:make_open_list      = 0
let g:neomake_list_height = 5

""""""""""""""""""""""""""""
"** Autocomplete settings **
""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" Python settings
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"""""""""""""""""""""
"** Theme settings **
"""""""""""""""""""""
colorscheme moonfly




