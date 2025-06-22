-- Brief Aside: **What is LSP?**
--
-- LSP is an acronym you've probably heard, but might not understand what it is.
--
-- LSP stands for Language Server Protocol. It's a protocol that helps editors
-- and language tooling communicate in a standardized fashion.
--
-- In general, you have a "server" which is some tool built to understand a particular
-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
-- processes that communicate with some "client" - in this case, Neovim!
--
-- LSP provides Neovim with features like:
--  - Go to definition
--  - Find references
--  - Autocompletion
--  - Symbol Search
--  - and more!
--
-- Thus, Language Servers are external tools that must be installed separately from
-- Neovim. This is where `mason` and related plugins come into play.
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`

---@module 'lazy'
---@type LazySpec[]
return {
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    ---@module 'lazydev'
    ---@type lazydev.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            window = {
              winblend = 0, -- transparent background for fidget.nvim
            },
          },
        },
      },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp', -- java
      -- java
      -- 'nvim-java/nvim-java',
      -- 'mfussenegger/nvim-jdtls',,
    },
    -- keybindings for LSP
    -- stylua: ignore start
    -- keys = {
    --    { "K", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
    --    { "gK", function() vim.lsp.buf.signature_help() end, desc = "Signature Documentation" },
    --    { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename" },
    --    { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Action", mode = { "n", "v" } },
    --    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    --    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    --    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    --    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    --    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    --    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    --    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    --  },

    -- stylua: ignore end
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('jbalibrea-lsp-attach', { clear = true }),
        callback = function(event)
          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              ---@diagnostic disable-next-line: param-type-mismatch
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
          then
            local highlight_augroup = vim.api.nvim_create_augroup('jbalibrea-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('jbalibrea-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'jbalibrea-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- FIX: temporaily fix for lsp like astro
      -- Error: Buffer X newer than edits
      vim.lsp.util.apply_text_document_edit = function(text_document_edit, index, offset_encoding)
        local text_document = text_document_edit.textDocument
        local bufnr = vim.uri_to_bufnr(text_document.uri)
        if offset_encoding == nil then
          vim.notify_once('apply_text_document_edit must be called with valid offset encoding', vim.log.levels.WARN)
        end
        vim.lsp.util.apply_text_edits(text_document_edit.edits, bufnr, offset_encoding)
      end
      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (populates installs via mason-tool-installer)
        automatic_installation = false,
        automatic_enable = true,
      }
    end,
  },

  {
    'mason-org/mason-tool-installer.nvim',
    config = function()
      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      -- NOTE: The following line is now commented as blink.cmp extends capabilites by default from its internal code:
      -- https://github.com/Saghen/blink.cmp/blob/102db2f5996a46818661845cf283484870b60450/plugin/blink-cmp.lua
      -- It has been left here as a comment for educational purposes (as the predecessor completion plugin required this explicit step).
      -- local capabilities = require('blink.cmp').get_lsp_capabilities()
      --
      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

      ---@type table<string, vim.lsp.Config>
      local servers = {
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        clangd = {
          cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
          },
          filetypes = { 'c', 'cpp', 'objc', 'objcpp' },

          on_attach = function(_, bufnr)
            vim.keymap.set(
              'n',
              '<leader>ch',
              '<cmd>LspClangdSwitchSourceHeader<cr>',
              { buffer = bufnr, desc = 'Switch Source/Header' }
            )
          end,
          capabilities = {
            offsetEncoding = { 'utf-16' },
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              completeUnimported = true,
              usePlaceholders = true,
              staticcheck = true,
            },
          },
        },
        -- TODO: mirar filetypes y keymaps
        ts_ls = {
          filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
          },
          on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }

            vim.keymap.set('n', '<leader>co', function()
              vim.lsp.buf.code_action {
                context = { only = { 'source.organizeImports' }, diagnostics = {} },
                apply = true,
              }
            end, vim.tbl_extend('force', opts, { desc = 'Organize Imports' }))

            vim.keymap.set('n', '<leader>cM', function()
              vim.lsp.buf.code_action {
                context = { only = { 'source.addMissingImports.ts' }, diagnostics = {} },
                apply = true,
              }
            end, vim.tbl_extend('force', opts, { desc = 'Add missing imports' }))

            vim.keymap.set('n', '<leader>cu', function()
              vim.lsp.buf.code_action {
                context = { only = { 'source.removeUnused.ts' }, diagnostics = {} },
                apply = true,
              }
            end, vim.tbl_extend('force', opts, { desc = 'Remove unused imports' }))

            vim.keymap.set('n', '<leader>cD', function()
              vim.lsp.buf.code_action {
                context = { only = { 'source.fixAll.ts' }, diagnostics = {} },
                apply = true,
              }
            end, vim.tbl_extend('force', opts, { desc = 'Fix all diagnostics' }))
          end,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = 'auto' },
          },
        },
      }
      -- Ensure the servers and tools above are installed
      ---@type string[]
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
        'lua-language-server', -- lua language server

        'astro-language-server', -- astro language server
        -- 'vtsls', -- js/ts language server
        'typescript-language-server', -- js/ts language server
        'prettier', -- prettier formatter
        'eslint', -- eslint language server
        'tailwindcss-language-server', -- tailwind language server

        'jdtls', -- java language server

        'marksman', -- markdown language server
        'markdownlint-cli2',
        'markdown-toc',

        'clangd', -- c/c++ language server
        'clang-format', -- c/c++ formatter

        -- 'isort', -- python formatter
        -- 'black', -- python formatter

        'rust_analyzer',

        'gopls', -- go language server

        -- shell stuff
        'shfmt',
        'air',
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      -- Merge server configurations with capabilities
      for server_name, server_config in pairs(servers) do
        vim.lsp.config(server_name, server_config)
        -- require('lspconfig')[server_name].setup(server_config)
      end
    end,
  },
}
