local M = {}

function M.set(name)
  vim.cmd.colorscheme(name)
  vim.notify('Theme set to ' .. name, vim.log.levels.INFO)
end

return M
