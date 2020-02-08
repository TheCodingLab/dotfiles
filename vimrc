set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'elzr/vim-json'
Plugin 'stephpy/vim-yaml'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
call vundle#end()
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ }
      \ }

set laststatus=2
set noshowmode

set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab

syntax on
