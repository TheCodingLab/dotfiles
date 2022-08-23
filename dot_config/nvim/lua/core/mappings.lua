vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)

-- Clipboard
map('v', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)
map('v', '<Leader>p', '"+p', opts)

-- Buffer navigation
map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', opts)


-- Telescope
map('n', '<C-f>', '<cmd>Telescope find_files<CR>', opts)
map('n', '<C-e>', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)

-- replaces mappings from `configs/lsp/handlers.lua`
map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

-- Lspsaga
map('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', 'ca', '<cmd>Lspsaga code_action<CR>', opts)
map('n', 'rn', '<cmd>Lspsaga rename<CR>', opts)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', '<C-u>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', opts)
map('n', '<C-d>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', opts)

-- Comment
map('n', '<leader>/', '<cmd>lua require(\'Comment.api\').toggle_current_linewise()<CR>', opts)
map('v', '<leader>/', '<esc><cmd>lua require(\'Comment.api\').toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Indent & stay in visual mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
