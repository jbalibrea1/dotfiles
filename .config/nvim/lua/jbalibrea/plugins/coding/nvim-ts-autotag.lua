---@diagnostic disable: missing-fields
-- Automatically add closing tags for HTML and JSX
return {
  'windwp/nvim-ts-autotag',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    }
  end,
}
