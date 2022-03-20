local M = {}

function M.config()
  local status_ok, lspconfig = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local handlers = require('configs.lsp.handlers')
  handlers.setup()

  local status_ok, user = pcall(require, 'user.lsp.init')
  if status_ok then
    user.config()
  end
end

return M
