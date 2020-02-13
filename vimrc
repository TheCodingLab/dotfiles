set nocompatible
filetype off

" vundle plugins
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
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/fzf.vim'
Plugin 'ycm-core/YouCompleteMe'

Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'phpstan/vim-phpstan'
call vundle#end()
filetype plugin indent on

set encoding=utf-8

" theme
colorscheme gruvbox
set background=dark

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" navigation
noremap <Tab> :tabnext<CR>
noremap <S-Tab> :tabprev<CR>

" fuzzy finder
set rtp+=~/.fzf
noremap <C-o> :FZF<CR>

" nerdtree
noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=50

" status line
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ }
      \ }

set laststatus=2
set noshowmode

" tabs to spaces
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab

" enable line numbers
set number

" syntax highlighting
syntax on
autocmd BufNewFile,BufRead *.twig set syntax=html

" PHP
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
