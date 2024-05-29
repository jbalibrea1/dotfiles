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

require 'jbalibrea.options'
require 'jbalibrea.keymaps'
require 'jbalibrea.init'

-- [[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update

require('lazy').setup {
  { import = 'jbalibrea.plugins' },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
