local M = {}

function M.organize_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { 'source.organizeImports' } }
  local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, 'UTF-8')
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

---@return string|nil
function M.find_module_file()
  if not vim.fs then
    return nil
  end

  local files = vim.fs.find({ 'go.mod' }, {
    upward = true,
  })

  if not next(files) then
    -- no workspace configuration found in parent dirs
    return nil
  end

  return files[1]
end

function M.find_module_name()
  local module_file = M.find_module_file()
  if not module_file then
    return nil
  end

  for line in io.lines(module_file) do
    if vim.startswith(line, 'module') then
      local items = vim.split(line, ' ')
      local module_name = vim.trim(items[2])
      return module_name
    end
  end

  return nil
end

function M.config()
  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = vim.api.nvim_create_augroup('go_format_imports', { clear = true }),
    pattern = { '*.go' },
    callback = function()
      M.organize_imports(1000)
    end,
  })
end

return M
