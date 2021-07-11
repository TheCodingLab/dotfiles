call plug#begin(stdpath('data') . '/plugged')

Plug 'doums/darcula'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'amiorin/vim-project'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', {'do': './install --no-update-rc'}
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ekalinin/dockerfile.vim', { 'for': 'dockerfile' }
Plug 'uarun/vim-protobuf', { 'for': 'proto' }

call plug#end()
