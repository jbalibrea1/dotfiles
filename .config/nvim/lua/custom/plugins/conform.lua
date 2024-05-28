return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        php = { 'intelephense' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- Rust and go
        rust = { { 'rustfmt', 'rustfmt-nightly' } },
        go = { { 'gofmt', 'gofumpt' } },

        -- Js - React jsx and tsx
        typescriptreact = { 'prettier' },
        typescript = { 'prettier' },
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
      },
    },
  },
}
