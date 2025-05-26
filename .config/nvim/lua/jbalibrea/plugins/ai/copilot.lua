return {
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

  -- copilot integration with cmp
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = { 'giuxtaposition/blink-cmp-copilot' },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      sources = {
        default = { 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
