--[[
--
--
--PERF:
      # #####    ##   #      # #####  #####  ######   ##   
      # #    #  #  #  #      # #    # #    # #       #  #  
      # #####  #    # #      # #####  #    # #####  #    # 
      # #    # ###### #      # #    # #####  #      ###### 
 #    # #    # #    # #      # #    # #   #  #      #    # 
  ####  #####  #    # ###### # #####  #    # ###### #    # 
--
--
-- 
--
--]]

-- [[ Initial setup ]]
-- Global options, keymaps, autocmds, and lazy
require 'jbalibrea.init'

-- [[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
require('lazy').setup({
  { import = 'jbalibrea.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
