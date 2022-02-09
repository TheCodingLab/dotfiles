local M = {}

function M.config()
  local status_ok, lspconfig = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local handlers = require('configs.lsp.handlers')
  handlers.setup()

  local servers = { 'gopls', 'vlang' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    }
  end
end

return M
