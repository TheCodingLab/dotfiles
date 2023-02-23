local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local mappings = require('config.lsp.mappings')
local server_config = require('config.lsp.server')

require('config.lsp.mason')
require('config.lsp.trouble')

for _, server in pairs(server_config.enabled) do
  local config = server_config[server] or {}
  config.on_attach = mappings.on_attach
  lspconfig[server].setup(config)
end
