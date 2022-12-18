vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)

-- Clipboard
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>p', '"+p')

-- Buffer navigation
vim.keymap.set('n', '<Tab>', vim.cmd.BufferLineCycleNext)
vim.keymap.set('n', '<S-Tab>', vim.cmd.BufferLineCyclePrev)


-- Telescope
vim.keymap.set('n', '<C-f>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<C-e>', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')

-- replaces mappings from `configs/lsp/handlers.lua`
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>')
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')
vim.keymap.set('n', '<leader>p', '<cmd>Telescope diagnostics<CR>')

-- Lspsaga
vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', 'ca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('v', 'ca', "<ESC><cmd>lua require('lspsaga.codeaction').range_code_action()<CR>")
vim.keymap.set('n', 'rn', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', '<C-u>', function() require('lspsaga.action').smart_scroll_with_saga(-1) end)
vim.keymap.set('n', '<C-d>', function() require('lspsaga.action').smart_scroll_with_saga(1) end)

-- Comment
vim.keymap.set('n', '<leader>/', '<cmd>lua require(\'Comment.api\').toggle.linewise()<CR>')
vim.keymap.set('v', '<leader>/', '<esc><cmd>lua require(\'Comment.api\').toggle.linewise(vim.fn.visualmode())<CR>')

-- Indent & stay in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Debugging
vim.keymap.set('n', '<F5>', '<cmd>lua require(\'dap\').continue()<CR>')
vim.keymap.set('n', '<F10>', '<cmd>lua require(\'dap\').step_over()<CR>')
vim.keymap.set('n', '<F11>', '<cmd>lua require(\'dap\').step_into()<CR>')
vim.keymap.set('n', '<F12>', '<cmd>lua require(\'dap\').step_out()<CR>')
vim.keymap.set('n', '<Leader>b', '<cmd>lua require(\'dap\').toggle_breakpoint()<CR>')
vim.keymap.set('n', '<Leader>dr', '<cmd>lua require(\'dap\').repl.open()<CR>')
vim.keymap.set('n', '<Leader>dl', '<cmd>lua require(\'dap\').run_last()<CR>')
