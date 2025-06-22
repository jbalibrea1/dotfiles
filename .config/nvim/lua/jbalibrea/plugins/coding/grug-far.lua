---@module 'lazy'
---@type LazySpec
return {
  'MagicDuck/grug-far.nvim',
  event = 'VeryLazy',
  ---@module 'grug-far'
  ---@type grug.far.Options
  ---@diagnostic disable-next-line: missing-fields
  opts = { headerMaxWidth = 80 },
  cmd = 'GrugFar',
  keys = {
    {
      '<leader>sr',
      function()
        local grug = require 'grug-far'
        local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
        grug.open {
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
          },
        }
      end,
      mode = { 'n', 'v' },
      desc = 'Search and Replace',
    },
  },
}
