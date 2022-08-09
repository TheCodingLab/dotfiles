local M = {}

function M.config()
  local status_ok, lspconfig = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local table_util = require('util.table')

  local handlers = require('configs.lsp.handlers')
  handlers.setup()

  local enabled_servers = {}
  local config = require('configs.lsp.defaults')

  local status_ok, user_config = pcall(require, 'user.lsp.config')
  if status_ok then
    if user_config.enabled_servers then
      enabled_servers = table_util.merge(enabled_servers, user_config.enabled_servers)
    end

    if user_config.config then
      config = table_util.merge(config, user_config.config)
    end
  end

  local status_ok, workspace_config = pcall(require, 'workspace.lsp.config')
  if status_ok and workspace_config then
    config = table_util.merge(config, workspace_config)
  end

  for _, lsp in pairs(enabled_servers) do
    local cfg = config[lsp] or {}
    cfg.on_attach = handlers.on_attach
    cfg.capabilities = handlers.capabilities
    lspconfig[lsp].setup(cfg)
  end
end

return M
