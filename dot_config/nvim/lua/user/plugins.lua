local M = {}

function M.setup(use)
  use {
    'lervag/vimtex',
    ft = { 'tex' },
    config = function()
      require('user.configs.vimtex').config()
    end,
  }
end

return M
