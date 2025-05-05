return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    init = function()
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo1', { fg = '#ff0086' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo2', { fg = '#ff009c' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo3', { fg = '#ff00b2' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo4', { fg = '#ff009c' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo5', { fg = '#ff0086' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo6', { fg = '#ff2986' })
    end,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          {
            pane = 2,
            text = {
              [[     ██╗██████╗  █████╗ ██╗     ██╗██████╗ ██████╗ ███████╗ █████╗ ]],
              hl = 'NeovimDashboardLogo1',
            },
          },
          {
            pane = 2,
            text = {
              [[     ██║██╔══██╗██╔══██╗██║     ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗]],
              hl = 'NeovimDashboardLogo2',
            },
          },
          {
            pane = 2,
            text = {
              [[     ██║██████╔╝███████║██║     ██║██████╔╝██████╔╝█████╗  ███████║]],
              hl = 'NeovimDashboardLogo3',
            },
          },
          {
            pane = 2,
            text = {
              [[██   ██║██╔══██╗██╔══██║██║     ██║██╔══██╗██╔══██╗██╔══╝  ██╔══██║]],
              hl = 'NeovimDashboardLogo4',
            },
          },
          {
            pane = 2,
            text = {
              [[╚█████╔╝██████╔╝██║  ██║███████╗██║██████╔╝██║  ██║███████╗██║  ██║]],
              hl = 'NeovimDashboardLogo5',
            },
          },
          {
            pane = 2,
            text = {
              [[ ╚════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝]],
              hl = 'NeovimDashboardLogo6',
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
      },
      -- explorer = { enabled = true },
      indent = { enabled = true },
      -- input = { enabled = true },
      -- picker = { enabled = true },
      notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
  },
}
