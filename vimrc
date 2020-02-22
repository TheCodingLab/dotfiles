set nocompatible
filetype off

" vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'junegunn/fzf.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'morhetz/gruvbox'
Plugin 'arzg/vim-colors-xcode'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'

Plugin 'elzr/vim-json'
Plugin 'stephpy/vim-yaml'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'

if $VIM_PHP_SUPPORT
    Plugin 'arnaud-lb/vim-php-namespace'
    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'phpstan/vim-phpstan'
    Plugin 'phpactor/phpactor'
endif
call vundle#end()
filetype plugin indent on

set encoding=utf-8

" theme
if $VIM_THEME_GRUVBOX
    colorscheme gruvbox
    set background=dark
    let g:gruvbox_contrast_dark='hard'

    nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
    nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
    nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

    nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
    nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
    nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
else
    colorscheme xcodedark
    let g:xcodedark_green_comments=1
endif

" navigation
noremap <Tab> :tabnext<CR>
noremap <S-Tab> :tabprev<CR>
noremap <Leader>b :ls<CR>:b<space>

let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" fuzzy finder
set rtp+=~/.fzf
noremap <C-f> :FZF<CR>

" nerdtree
noremap <C-n> :NERDTreeToggle<CR>
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

if $VIM_PHP_SUPPORT
    function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
   
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>t :call phpactor#Transform()<CR>
endif
