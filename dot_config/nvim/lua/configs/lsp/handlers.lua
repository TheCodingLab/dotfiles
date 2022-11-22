local M = {}

function M.setup()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ 'CursorHold' }, {
      group = vim.api.nvim_create_augroup('lsp_document_highlight_hold', { clear = true }),
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
      group = vim.api.nvim_create_augroup('lsp_document_highlight_moved', { clear = true }),
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

local function lsp_autoformat(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      group = vim.api.nvim_create_augroup('lsp_autoformat', { clear = true }),
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
end

local function lsp_keymaps(bufnr)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, { buffer = bufnr })
  vim.keymap.set('i', '<C-p>', vim.lsp.buf.signature_help, { buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'go', vim.diagnostic.open_float, { buffer = bufnr })
end

function M.on_attach(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_autoformat(client)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = capabilities

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return M
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
