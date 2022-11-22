local M = {}

function M.config()
  local status_ok, mason = pcall(require, 'mason')
  if not status_ok then
    return
  end

  mason.setup()

  local defaults = require('configs.lsp.defaults')

  local mason_lspconfig = require('mason-lspconfig')
  mason_lspconfig.setup({
    ensure_installed = defaults.enabled_servers,
  })
end

return M
