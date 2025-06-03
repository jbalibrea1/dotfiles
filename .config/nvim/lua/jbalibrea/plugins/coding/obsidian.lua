return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    keys = {
      {
        '<leader>on',
        '<cmd>ObsidianNewFromTemplate<CR>',
        desc = 'Obisdian Insert Template',
      },
      {
        '<leader>or',
        '<cmd>ObsidianRename<CR>',
        desc = 'Obisdian Rename',
      },
      {
        '<leader>o',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Obsidian',
      },
    },
    opts = {
      workspaces = {
        {
          name = 'main',
          path = '~/personal/vaults/main',
        },
        -- {
        --   name = 'work',
        --   path = '~/vaults/work',
        -- },
      },

      -- see below for full list of options 👇
      templates = {
        folder = 'templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },
    },
  },

  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    ft = 'markdown',
    dependencies = {
      { 'epwalsh/obsidian.nvim' },
      { 'saghen/blink.compat', lazy = true, version = false },
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      sources = {
        default = { 'obsidian', 'obsidian_new', 'obsidian_tags' },
        providers = {
          obsidian = {
            name = 'obsidian',
            module = 'blink.compat.source',
          },
          obsidian_new = {
            name = 'obsidian_new',
            module = 'blink.compat.source',
          },
          obsidian_tags = {
            name = 'obsidian_tags',
            module = 'blink.compat.source',
          },
        },
      },
    },
  },
}
