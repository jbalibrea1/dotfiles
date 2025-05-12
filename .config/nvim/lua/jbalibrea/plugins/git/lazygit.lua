return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    -- stylua: ignore start
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    { '<leader>gl', function() Snacks.picker.git_log { cwd = vim.fn.getcwd() } end, desc = 'Git Log', },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File', },
    { '<leader>gb', function() Snacks.picker.git_log_line() end, desc = 'Git Blame Line', },
    -- stylua: ignore end
  },
}
