local M = {}

function M.config()
  local status_ok, lspconfig = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local handlers = require('configs.lsp.handlers')

  local servers = { 'gopls', 'clangd', 'asm_lsp', 'rust_analyzer' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    }
  end

  lspconfig.texlab.setup {
    cmd = { '/home/florian/.local/share/nvim/lsp_servers/latex/texlab' },
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }
end

return M
