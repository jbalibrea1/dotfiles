---@module 'lazy'
---@type LazySpec
return {
  -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  lazy = false,
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = 'Format',
    },
  },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 1500,
          lsp_format = 'fallback',
        }
      end
    end,
    default_format_opts = {
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      -- rust = { { 'rustfmt', 'rustfmt-nightly' } },
      go = { 'gofmt', 'gofumpt', stop_after_first = true },
      -- markdown = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
      markdown = { 'prettier', 'markdownlint-cli2' },
      ['markdown.mdx'] = { 'prettier', 'markdownlint-cli2' },

      -- INFO: idk but prettierd dont respect .prettierrc, so I use prettier
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { 'prettier', 'prettierd', stop_after_first = true },
      typescript = { 'prettier', 'prettierd', stop_after_first = true },
      javascriptreact = { 'prettier', 'prettierd', stop_after_first = true },
      typescriptreact = { 'prettier', 'prettierd', stop_after_first = true },
      css = { 'prettier', 'prettierd', stop_after_first = true },
      astro = { 'prettier', 'prettierd', stop_after_first = true },

      c = { 'clang-format' },
      sh = { 'shfmt' },
    },
  },
}
