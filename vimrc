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
" Plugin configuration
" We are using vim-plug to manage our plugins
" [o] Fugitive (Git integration)
" [o] Surround
" [o] YouCompleteMe
" [o] Fzf (Fuzzy Finder) 
" [ ] Nerdtree
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
" Use <C-p> to search files path
  nnoremap <silent> <C-p> :FZF -m <cr>

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

" Map a key to toggle NERDTree
  map <C-n> :NERDTreeToggle <CR>
" }}}

" End plugin configuration
call plug#end()

" ========================================================= "
" Interface configuration
" [o] Show line numbers
" [o] Highlight search
" [o] No lime wrap
" [o] Syntax colors
" [o] Better colorscheme 
" ========================================================= "
    
set number
set hls
set nowrap
colorscheme murphy
syntax on

" ========================================================= "
" Usability configuration
" [o] Incremental search
" [o] Ignorecase and smartcase 
" [o] Use spaces instead of tabs
" [o] TabSize=2, ShiftWidth=2, AutoIndent, SmartIndent 
" [o] Normal usage of backspace
" ========================================================= "

set incsearch
set ignorecase
set smartcase
set expandtab
set ts=2 sw=2 ai si
set backspace=2

" ========================================================= "
" Performance configuration
" [o] No backups 
" [o] Lazy redraw
" ========================================================= "

set noswapfile
set nobackup
set nowb
set lazyredraw
