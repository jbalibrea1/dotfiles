return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    lazy = false,
    keys = {
      {
        '<leader>bf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[B]uffer [F]ormat',
      },
    },
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
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- php = { 'intelephense' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },

        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettier", "prettierd", stop_after_first = true },

        -- Rust and go
        -- rust = { { 'rustfmt', 'rustfmt-nightly' } },

        -- GO
        go = { 'gofmt', 'gofumpt', stop_after_first = true },

        -- md
        markdown = { 'prettier', 'prettierd', stop_after_first = true },

        -- idk but prettierd dont respect .prettierrc
        -- js, ts, jsx and tsx
        javascript = { 'prettier', 'prettierd', stop_after_first = true },
        typescript = { 'prettier', 'prettierd', stop_after_first = true },
        javascriptreact = { 'prettier', 'prettierd', stop_after_first = true },
        typescriptreact = { 'prettier', 'prettierd', stop_after_first = true },

        -- astro
        astro = { 'prettier', 'prettierd', stop_after_first = true },
      },
    },
  },
}
