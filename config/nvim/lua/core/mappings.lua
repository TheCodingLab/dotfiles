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
map('n', '<Tab>', '<cmd>bnext<CR>', opts)
map('n', '<S-Tab>', '<cmd>bprevious<CR>', opts)

-- Telescope
map('n', '<C-f>', '<cmd>Telescope find_files<CR>', opts)

-- Lspsaga
map('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', 'ca', '<cmd>Lspsaga code_action<CR>', opts)
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'rn', '<cmd>Lspsaga rename<CR>', opts)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
map('n', '<C-u>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<cr>', opts)
map('n', '<C-d>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<cr>', opts)

-- Comment
map('n', '<leader>/', '<cmd>lua require(\'Comment.api\').toggle_current_linewise()<CR>', opts)
map('v', '<leader>/', '<esc><cmd>lua require(\'Comment.api\').toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Indent & stay in visual mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

