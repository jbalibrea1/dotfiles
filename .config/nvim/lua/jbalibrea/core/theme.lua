local M = {}

function M.set(theme)
  theme = theme or 'tokyonight'
  vim.cmd.colorscheme(theme)
  -- vim.notify('Theme set to ' .. theme, vim.log.levels.INFO)
end

return M
