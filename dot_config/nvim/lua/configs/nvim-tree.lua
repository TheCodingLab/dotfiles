local status_ok, nvimtree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

nvimtree.setup {
  filters = {
    dotfiles = false,
    custom = {
      '.git',
      'node_modules',
      '.cache',
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    'dashboard',
    'startify',
    'alpha',
  },
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  view = {
    width = 50,
    side = 'left',
    hide_root_folder = true,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          deleted = '',
          ignored = '◌',
          renamed = '➜',
          staged = '✓',
          unmerged = '',
          unstaged = '✗',
          untracked = '★',
        },
        folder = {
          default = '',
          empty = '',
          empty_open = '',
          open = '',
          symlink = '',
          symlink_open = '',
        },
      },
      show = {
        file = true,
        folder = true,
        git = true,
        folder_arrow = false,
      },
    },
  },
}
