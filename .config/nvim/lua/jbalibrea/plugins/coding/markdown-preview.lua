return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  keys = {
    {
      '<leader>mp',
      function()
        vim.cmd.MarkdownPreviewToggle()
      end,
      mode = 'n',
      desc = 'Markdown Preview',
    },
  },
  ft = { 'markdown' },
  -- config = function()
  --   vim.g.mkdp_browser = 'Brave Browser'
  --   vim.g.mkdp_auto_start = 1
  --   vim.g.mkdp_auto_close = 0
  --   vim.g.mkdp_refresh_slow = 0
  --   vim.g.mkdp_open_to_the_world = 1
  --   vim.g.mkdp_port = '8080'
  --   vim.g.mkdp_echo_preview_url = 1
  --   vim.g.mkdp_command_for_global = 1
  -- end,
}
