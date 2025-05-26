return {
  { -- Linting
    'mfussenegger/nvim-lint',
    events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint-cli2' },
        -- python = { 'pylint' },
        -- lua = { 'cspell' },
      }

      local mdlint = lint.linters['markdownlint-cli2']
      local config_path = vim.fn.expand '~/.markdownlint.yml'
      if vim.fn.filereadable(config_path) == 1 then
        mdlint.args = {
          '--config',
          config_path,
          '--',
        }
      else
        mdlint.args = { '--' }
      end

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
      -- if u want to trigger linting manually, uncomment the following lines
      --   vim.keymap.set('n', '<leader>tl', function()
      --     lint.try_lint()
      --   end, { desc = 'Trigger linting for current file' })
      --
    end,
  },
}
