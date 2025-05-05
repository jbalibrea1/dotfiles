return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = false,
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- php = { 'intelephense' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- Rust and go
        -- rust = { { 'rustfmt', 'rustfmt-nightly' } },

        -- GO
        go = { 'gofmt', 'gofumpt', stop_after_first = true },

        -- md
        markdown = { 'prettierd', 'prettier', stop_after_first = true },

        -- js, ts, jsx and tsx
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },

        -- astro
        astro = { 'prettierd', 'prettier', 'astro', stop_after_first = true },
      },
      formatters = {
        prettier = {
          prepend_args = { '--single-quote', '--trailing-comma', 'none' },
        },
      },
    },
  },
}
