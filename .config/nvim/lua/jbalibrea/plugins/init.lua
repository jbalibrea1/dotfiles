-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
--
return {
  -- Language Server Protocol
  { import = 'jbalibrea.plugins.lsp' },

  -- Editor enhancements
  { import = 'jbalibrea.plugins.editor' },

  -- Git integration
  { import = 'jbalibrea.plugins.git' },

  -- Development tools
  { import = 'jbalibrea.plugins.coding' },

  -- User Interface
  { import = 'jbalibrea.plugins.ui' },

  -- Utilities
  { import = 'jbalibrea.plugins.utils' },

  -- AI tools
  { import = 'jbalibrea.plugins.ai' },

  -- Formatting tools
  { import = 'jbalibrea.plugins.formatting' },
}
