local M = {}

function M.config()
  -- local status_ok, vimtex = pcall(require, 'vimtex')
  -- if not status_ok then
  --   return
  -- end

  vim.cmd [[
    let g:vimtex_syntax_enabled = 0

    let g:vimtex_compiler_enabled = 1
    let g:vimtex_compiler_method = 'generic'
    let g:vimtex_compiler_generic = {
    \  'command': 'make watch',
    \ }

    let g:vimtex_view_method = 'zathura'
  ]]
end

return M
