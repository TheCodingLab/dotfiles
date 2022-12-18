local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.load_extension('fzf')

vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      command = 'normal! zx'
    })
  end
})

local previewers = require('telescope.previewers')
local previewers_utils = require('telescope.previewers.utils')
local max_size = 100000

local function preview_maker(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end

    if stat.size > max_size then
      local cmd = { 'head', '-c', max_size, filepath }
      previewers_utils.job_maker(cmd, bufnr, opts)
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = '❯ ',
    path_display = { 'smart' },
    file_ignore_patterns = { 'third_party', '^/usr/include' },

    vimgrep_arguments = { 'ag', '--vimgrep' },
    buffer_previewer_maker = preview_maker,
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}
