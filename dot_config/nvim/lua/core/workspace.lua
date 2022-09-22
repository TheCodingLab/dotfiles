local M = {
  initialized = false,
}

---@return string|nil
local function find_workspace_init()
  if not vim.fs then
    return nil
  end

  local files = vim.fs.find({ '.nvim/workspace/init.lua' }, {
    upward = true,
  })

  if not next(files) then
    -- no workspace configuration found in parent dirs
    return nil
  end

  return files[1]
end

function M.init()
  local workspace_init = find_workspace_init()
  if not workspace_init then
    return
  end

  local lua_workspace_dir = vim.fs.dirname(workspace_init)
  local lua_import_dir = vim.fs.dirname(lua_workspace_dir)
  local workspace_dir = vim.fs.dirname(lua_import_dir)

  local lua_path = lua_import_dir .. '/?.lua'
  package.path = package.path .. ';' .. lua_path

  M.workspace_dir = workspace_dir
  M.initialized = true
end

function M.config()
  if not M.initialized then
    return
  end

  M.workspace = require('workspace.init')
end

return M
