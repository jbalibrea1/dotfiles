vim.api.nvim_set_hl(0, 'NeovimDashboardLogo1', { fg = '#ff0086' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo2', { fg = '#ff009c' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo3', { fg = '#ff00b2' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo4', { fg = '#ff009c' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo5', { fg = '#ff0086' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo6', { fg = '#ff2986' })
---@class snacks.dashboard.Opts
return {
  preset = {
    keys = {
      { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
      { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
  },
  sections = {
    { section = 'header' },
    {
      pane = 2,
      text = {
        {
          [[     ██╗██████╗  █████╗ ██╗     ██╗██████╗ ██████╗ ███████╗ █████╗ ]],
          hl = 'NeovimDashboardLogo1',
        },
      },
    },
    {
      pane = 2,
      text = {
        {
          [[     ██║██╔══██╗██╔══██╗██║     ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗]],
          hl = 'NeovimDashboardLogo2',
        },
      },
    },
    {
      pane = 2,
      text = {
        {
          [[     ██║██████╔╝███████║██║     ██║██████╔╝██████╔╝█████╗  ███████║]],
          hl = 'NeovimDashboardLogo3',
        },
      },
    },
    {
      pane = 2,
      text = {
        {
          [[██   ██║██╔══██╗██╔══██║██║     ██║██╔══██╗██╔══██╗██╔══╝  ██╔══██║]],
          hl = 'NeovimDashboardLogo4',
        },
      },
    },
    {
      pane = 2,
      text = {
        {
          [[╚█████╔╝██████╔╝██║  ██║███████╗██║██████╔╝██║  ██║███████╗██║  ██║]],
          hl = 'NeovimDashboardLogo5',
        },
      },
    },
    {
      pane = 2,
      text = {
        {
          [[ ╚════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝]],
          hl = 'NeovimDashboardLogo6',
        },
      },
    },
    { section = 'keys', gap = 1, padding = 1 },
    { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
    { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
    {
      pane = 2,
      icon = ' ',
      title = 'Git Status',
      section = 'terminal',
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = 'git status --short --branch --renames',
      height = 5,
      padding = 1,
      ttl = 5 * 60,
      indent = 3,
    },
    { section = 'startup' },
  },
}
