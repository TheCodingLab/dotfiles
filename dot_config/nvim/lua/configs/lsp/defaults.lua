local lsp_server_path = vim.fn.stdpath('data') .. '/lsp_servers'

local function gopls()
  local config = {
    cmd = { lsp_server_path .. '/go/gopls', 'serve' },
    settings = {
      gopls = {
      },
    },
  }

  local module_name = require('core.ft.go').find_module_name()
  if module_name then
    config.settings.gopls['local'] = module_name
  end

  return config
end

return {
  gopls = gopls(),
}
