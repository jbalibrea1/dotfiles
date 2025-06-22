---@diagnostic disable: missing-fields
-- Automatically add closing tags for HTML and JSX
--
---@module 'lazy'
---@type LazySpec
return {
  'windwp/nvim-ts-autotag',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  config = function()
    require('nvim-ts-autotag').setup {
      ---@module 'nvim-ts-autotag'
      ---@type nvim-ts-autotag.Opts
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    }
  end,
}
