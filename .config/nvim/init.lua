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
]]
--  See `:help lua-guide-autocommands`

require 'custom.options'
require 'custom.keymaps'

-- [[ Configure and install plugins ]]
require 'custom'

--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- If you want to add more plugins, you can do so by adding them here.
-- copilot can u change the sintax to the one below
require('lazy').setup {
  { import = 'custom.plugins' },
}
--   -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--   --    This is the easiest way to modularize your config.
--   --
--   --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
--   --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
--   { import = 'custom.plugins' },
-- }
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
