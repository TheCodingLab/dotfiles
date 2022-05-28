vim.opt.fileencoding = 'utf-8'                      -- File content encoding for the buffer
vim.opt.spelllang = 'en'                            -- Support US english
vim.opt.signcolumn = 'yes'                          -- Always show the sign column
vim.opt.completeopt = { 'menuone', 'noselect' }     -- Options for insert mode completion

vim.opt.termguicolors = true                        -- Enable 24-bit RGB color in the TUI
vim.opt.hlsearch = true                             -- Highlight all the matches of search pattern
vim.opt.expandtab = true                            -- Enable the use of spaces instead of tabs
vim.opt.cursorline = true                           -- Highlight the text line of the cursor
vim.opt.number = true                               -- Enable line numbers
vim.opt.wrap = false                                -- Disable line wrapping when longer than window size
vim.opt.showmode = false                            -- Disable showing modes

vim.opt.backup = false                              -- Disable making a backup file
vim.opt.writebackup = false                         -- Disable making a backup before overwriting a file
vim.opt.swapfile = false                            -- Disable use of swapfile for the buffer
vim.opt.undofile = true                             -- Enable persistent undo

vim.opt.colorcolumn = '120'                         -- Show column indicator to show maximum line length

vim.opt.cmdheight = 1                               -- Number of screen lines to use for the command line
vim.opt.shiftwidth = 2                              -- Number of spaces for indentation
vim.opt.tabstop = 2                                 -- Number of spaces in a tab
vim.opt.scrolloff = 8                               -- Number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                           -- Number of columns to keep at the sides of the cursor

vim.opt.pumheight = 10                              -- Height of the pop up menu
vim.opt.timeoutlen = 300                            -- Length of time to wait for a mapped sequence
vim.opt.updatetime = 300                            -- Length of time to wait before triggering the plugin

vim.opt.mouse = 'a'                                 -- Enable mouse support

vim.opt.listchars = {
  eol = '¬',
  tab = '▸ ',
  trail = '×',
}
