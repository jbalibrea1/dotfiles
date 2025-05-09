return {
  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    spec = {
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>b', group = '[B]uffers' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
  -- config = function() -- This is the function that runs, AFTER loading
  --   require('which-key').setup()
  --
  --   -- Document existing key chains
  --   require('which-key').register {
  --     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  --     ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  --     ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  --     ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  --     ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  --     ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  --     ['<leader>b'] = { name = '[B]uffers', _ = 'which_key_ignore' },
  --     ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
  --   }
  --   -- visual mode
  --   require('which-key').register({
  --     ['<leader>h'] = { 'Git [H]unk' },
  --   }, { mode = 'v' })
  -- end,
}
