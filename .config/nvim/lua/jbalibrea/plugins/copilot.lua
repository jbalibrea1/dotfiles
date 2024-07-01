return {
  {
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      opts = {
        suggestion = { enabled = false, auto_trigger = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
          yaml = true,
          gitcommit = true,
          gitrebase = true,
        },
      },
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
