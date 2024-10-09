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
