local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

local colors = {
  fg = '#787e87',
  fg_lighter = '#abb2bf',

  bg = '#2c323c',
  bg_darker = '#1e222a',
}

bufferline.setup {
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },

    modified_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    view = 'multiwindow',
    separator_style = 'thin',
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,

    show_close_icon = false,
    show_buffer_close_icons = false,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    diagnostics = false,
  },

  -- highlights = {
  --   fill = {
  --     fg = colors.fg,
  --     bg = colors.bg,
  --   },

  --   background = {
  --     fg = colors.fg,
  --     bg = colors.bg,
  --   },

  --   separator = {
  --     fg = colors.bg,
  --     bg = colors.bg,
  --   },

  --   duplicate = {
  --     fg = colors.fg,
  --     bg = colors.bg,
  --   },

  --   buffer_selected = {
  --     fg = colors.fg_lighter,
  --     bg = colors.bg_darker,
  --   },

  --   indicator_selected = {
  --     fg = colors.fg_lighter,
  --     bg = colors.bg_darker,
  --   },
  -- },
}
