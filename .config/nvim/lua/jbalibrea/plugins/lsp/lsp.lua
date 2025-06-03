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
return {
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
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
      'williamboman/mason-lspconfig.nvim',
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
      'saghen/blink.cmp',

      -- java
      -- 'nvim-java/nvim-java',
      -- 'mfussenegger/nvim-jdtls',
    },
    -- keybindings for LSP
    keys = {
      -- stylua: ignore start
      { "K", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
      { "gK", function() vim.lsp.buf.signature_help() end, desc = "Signature Documentation" },
      { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename" },
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Action", mode = { "n", "v" } },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- stylua: ignore end
    },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('jbalibrea-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remove unused binds?
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          -- local mapOR = function(keys, func, desc, mode)
          --   mode = mode or 'n'
          --   vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          -- end

          -- local map = function(keys, func, desc, mode, opts)
          --   mode = mode or 'n'
          --   opts = opts or {}
          --   vim.keymap.set(mode, keys, func, vim.tbl_deep_extend('force', { buffer = event.buf, desc = desc }, opts))
          -- end

          -- local builtins = require 'telescope.builtin'
          -- -- Jump to the definition of the word under your cursor.
          -- --  This is where a variable was first declared, or where a function is defined, etc.
          -- --  To jump back, press <C-t>.
          -- map('gd', builtins.lsp_definitions, '[G]oto [D]efinition')
          -- map('gs', definition_split, '[G]oto Definition [S]plit')
          --
          -- -- Find references for the word under your cursor.
          -- map('gr', builtins.lsp_references, '[G]oto [R]eferences')
          --
          -- -- Jump to the implementation of the word under your cursor.
          -- --  Useful when your language has ways of declaring types without an actual implementation.
          -- map('gI', builtins.lsp_implementations, '[G]oto [I]mplementation')
          --
          -- -- Jump to the type of the word under your cursor.
          -- --  Useful when you're not sure what type a variable is and you want to see
          -- --  the definition of its *type*, not where it was *defined*.
          -- map('<leader>D', builtins.lsp_type_definitions, 'Type [D]efinition')
          --
          -- -- Fuzzy find all the symbols in your current document.
          -- --  Symbols are things like variables, functions, types, etc.
          -- map('<leader>ds', builtins.lsp_document_symbols, '[D]ocument [S]ymbols')
          --
          -- -- Fuzzy find all the symbols in your current workspace
          -- --  Similar to document symbols, except searches over your whole project.
          -- map('<leader>ws', builtins.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          --
          -- -- Rename the variable under your cursor
          -- --  Most Language Servers support renaming across files, etc.
          -- map('<leader>cr', vim.lsp.buf.rename, 'Rename')
          --
          -- -- Execute a code action, usually your cursor needs to be on top of an error
          -- -- or a suggestion from your LSP for this to activate.
          -- map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'v' })
          --
          -- -- Opens a popup that displays documentation about the word under your cursor
          -- --  See `:help K` for why this keymap
          -- map('K', vim.lsp.buf.hover, 'Hover Documentation')
          -- map('gK', vim.lsp.buf.signature_help, 'Signature Documentation')
          --
          -- -- WARN: This is not Goto Definition, this is Goto Declaration.
          -- --  For example, in C this would take you to the header
          -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

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
          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          -- now with snacks
          -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          --   map('<leader>tH', function()
          --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          --   end, '[T]oggle Inlay [H]ints')
          -- end

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
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      --
      local servers = {
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
          root_dir = function(fname)
            return require('lspconfig.util').root_pattern('Makefile', 'configure.ac', 'compile_commands.json', '.git')(
              fname
            ) or vim.fn.getcwd()
          end,
          -- Opcional: Añade keymaps específicos para clangd
          on_attach = function(client, bufnr)
            vim.keymap.set(
              'n',
              '<leader>ch',
              '<cmd>ClangdSwitchSourceHeader<cr>',
              { buffer = bufnr, desc = 'Switch Source/Header' }
            )
          end,
          capabilities = { -- Asegúrate de que las capabilities se hereden correctamente
            offsetEncoding = { 'utf-16' },
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
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        ts_ls = {
          on_attach = function(client, bufnr)
            if client.name == 'ts_ls' then
              vim.keymap.set('n', '<leader>co', function()
                vim.lsp.buf.code_action {
                  context = {
                    only = { 'source.organizeImports' },
                    diagnostics = {},
                  },
                  apply = true,
                }
              end, { buffer = bufnr, desc = 'Organize Imports' })
            end
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

      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
        'lua-language-server', -- lua language server

        'astro-language-server', -- astro language server
        -- 'vtsls', -- js/ts language server  -- 'typescript-language-server',
        'ts_ls',
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
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        automatic_enable = true,
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            print('Configurando: ' .. server_name) -- Depuración
            if server_name == 'clangd' then
              print(vim.inspect(servers.clangd)) -- Verifica la configuración
            end
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
