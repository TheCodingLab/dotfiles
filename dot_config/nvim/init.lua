require('configs.impatient')

require('core.options')
require('core.plugins')
require('core.mappings')
require('core.ft')

local compiled_ok, _ = pcall(require, 'packer_compiled')
if compiled_ok then
  require('packer_compiled')
end

require('core.theme')

require('util.workspace').init()

require('configs.nvim-tree')
require('configs.bufferline')
require('configs.lualine')

require('configs.autopairs')
require('configs.comment')

require('configs.treesitter')
require('configs.lsp')

require('configs.cmp')
require('configs.luasnip')

require('configs.dap')
require('configs.telescope')
