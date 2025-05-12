return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  keys = {
    { 'gz', '', desc = '+surround' },
  },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we disable the section for
    -- cursor information because line numbers are already enabled
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      -- return ''
      return '%2l:%-2v'
    end

    --indent
    -- require('mini.indentscope').setup {
    --   -- symbol = '▏',
    --   symbol = '│',
    --   options = { try_as_border = true },
    -- }

    --hipattern
    local hp = require 'mini.hipatterns'
    hp.setup {
      highlighters = {
        hex_color = hp.gen_highlighter.hex_color(),
      },
    }

    require('mini.tabline').setup()
  end,
}
