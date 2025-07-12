"
" Should be located in ~/.vimrc
"
" Install vim-plug using 
" `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
"
" Then call `:PlugInstall` in editor
"

set number
set relativenumber
set expandtab
set tabstop=4
set hlsearch
set incsearch
set shiftwidth=4
set cursorline
set showmatch
set autoindent
set smarttab
set softtabstop=4
set nocompatible
set wildmenu
set ruler

filetype on
syntax on

let mapleader = " "

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

" Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'

call plug#end()

" Plugin config
let g:lightline = { 'colorscheme': 'palenight' }

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = "palenight"

let g:fzf_action = { 'ctrl-t': 'tab split' }

colorscheme palenight 
set background=dark

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ call feedkeys(":quit\<CR>:\<BS>") | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ call feedkeys(":quit\<CR>:\<BS>") | endif

autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>j :NERDTreeFind<CR>

noremap <C-t>t :tabnew<CR>
noremap <C-t>c :tabclose<CR>
noremap <C-t>h :tabprev<CR>
noremap <C-t>l :tabnext<CR>

noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

noremap <C-b>h :bprev<CR>
noremap <C-b>l :bnext<CR>

nnoremap <C-p> :Files<CR>
nnoremap <Leader>g :GFiles<CR>
