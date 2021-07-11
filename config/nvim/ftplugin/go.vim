" Let COC manage `gd` shortcut
let g:go_def_mapping_enabled = 0

let g:go_imports_mode = 'goimports'

autocmd FileType go let b:go_fmt_options = {
    \ 'goimports': '-local=github.com/thecodinglab'
  \ }
