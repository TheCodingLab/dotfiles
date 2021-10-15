" general
"" tabs to spaces
set tabstop=2
set shiftwidth=2
set expandtab
"" enable line numbers
set number
"" disable mode display
set noshowmode
"" disable line wrapping
set nowrap
"" line wrap indicator
set colorcolumn=120

" NERDTree
let g:NERDTreeWinSize=50
"" auto open NERDTree
autocmd BufWinEnter * NERDTreeMirror
"" auto close if NERDTree is last opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
EOF


" shortcuts
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>
"" tab navigation
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
