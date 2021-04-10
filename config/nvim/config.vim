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


" NERDTree
let g:NERDTreeWinSize=50
"" auto open NERDTree
""" autocmd VimEnter * NERDTree
""" autocmd VimEnter * wincmd p
"" auto close if NERDTree is last opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" shortcuts
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>
"" tab navigation
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
