local status_ok, onedark = pcall(require, 'onedark')
if not status_ok then
  return
end

onedark.setup {
  style = 'darker',
  highlights = {
    LspReferenceText = { fg = 'NONE', bg = '#3e4452', fmt = 'NONE' },
    LspReferenceRead = { fg = 'NONE', bg = '#3e4452', fmt = 'NONE' },
    LspReferenceWrite = { fg = 'NONE', bg = '#3e4452', fmt = 'NONE' },
  },
}

vim.cmd.colorscheme('onedark')
