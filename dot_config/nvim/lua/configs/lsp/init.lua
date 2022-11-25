local M = {}

function M.config()
  local status_ok, lspconfig = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local tbl = require('util.table')
  local workspace = require('util.workspace')

  local handlers = require('configs.lsp.handlers')
  handlers.setup()

  local defaults = require('configs.lsp.defaults')

  local enabled_servers = defaults.enabled_servers
  local config = defaults.config

  local status_ok, user_config = pcall(require, 'user.lsp.config')
  if status_ok then
    if user_config.enabled_servers then
      enabled_servers = tbl.merge(enabled_servers, user_config.enabled_servers)
    end

    if user_config.config then
      config = tbl.merge(config, user_config.config)
    end
  end

  local status_ok, workspace_config = workspace.load('lsp.config')
  if status_ok then
    if workspace_config.enabled_servers then
      enabled_servers = tbl.merge(enabled_servers, workspace_config.enabled_servers)
    end

    if workspace_config.config then
      config = tbl.merge(config, workspace_config.config)
    end
  end
  
  for _, lsp in pairs(enabled_servers) do
    local cfg = config[lsp] or {}
    cfg.on_attach = handlers.on_attach
    cfg.capabilities = handlers.capabilities
    lspconfig[lsp].setup(cfg)
  end
end

return M
