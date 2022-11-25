local tbl = require('util.table')
local path = require('plenary.path')

local M = {
  loaded = false,
}

local default_opts = {
  config_dir = '.work',
}

local function eval(filename)
  local f = assert(loadfile(filename))
  return f()
end

local function error_handler(err)
  error(err)
end

function M.load(filename)
  if not M.loaded then
    return false, nil
  end

  filename = string.gsub(filename, '%.', '/')

  local path = M.config_dir / (filename .. '.lua')
  return xpcall(eval, error_handler, path:absolute())
end

function M.setup(opts)
  opts = tbl.merge(default_opts, opts)

  local config_dir = path:new(opts.config_dir)
  if not config_dir:exists() or not config_dir:is_dir() then
    return
  end

  M.workspace_dir = config_dir:parent()
  M.config_dir = config_dir
  M.loaded = true

  local status_ok, init_module = M.load('init')
  if not status_ok then
    return
  end

  init_module.setup()
end

return M
