local M = {}

function M.config()
  local status_ok, coverage = pcall(require, 'coverage')
  if not status_ok then
    return
  end

  coverage.setup({
    commands = true, -- create commands
    highlights = {
      covered = { fg = '#C3E88D' },
      uncovered = { fg = '#F07178' },
    },
    signs = {
      covered = { hl = 'CoverageCovered', text = '▎' },
      uncovered = { hl = 'CoverageUncovered', text = '▎' },
    },
    summary = {
      min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
    },
  })


  coverage.setup({})
end

return M
