# Neovim Configuration

## English

### Overview

This is my personal Neovim configuration, built with a focus on productivity and
modern development workflows. The configuration is organized in a modular way,
making it easy to maintain and extend.

### Features

- 🎨 Beautiful UI
- 🚀 Fast startup with lazy loading
- 📦 Plugin management with lazy.nvim
- 🎯 LSP support for multiple languages
- 🎮 Enhanced editing experience
- 🎨 Multiple theme support
- 🛠️ Git integration
- 🤖 AI coding assistance

### Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (recommended: Iosevka Nerd Font)

### Installation

- To test u can use the following command:

```bash
git clone git@github.com:jbalibrea1/dotfiles ~/.config/jbalibrea1/dotfiles
NVIM_APPNAME=jbalibrea1/dotfiles/.config/nvim nvim
```

1. Clone this repository:

   ```bash
   git clone git@github.com:jbalibrea1/dotfiles  ~/.config/nvim
   ```

2. Install dependencies:

   ```bash
   # Install a Nerd Font (optional but recommended)
   # For Arch Linux:
   yay -S ttf-iosevka-nerd
   # For other systems, download from:
   # https://www.nerdfonts.com/font-downloads
   ```

3. Start Neovim and let it install plugins:

   ```bash
   nvim
   ```

### Configuration Structure

```bash
nvim/
├── init.lua                 # Main entry point
└── lua/
    └── jbalibrea/           # Main configuration directory
        ├── init.lua         # Loads core modules and plugins
        └── plugins          # Organized plugin categories
            ├── init.lua     # loads plugins
            ├── core/        # Core settings
            ├── ui/          # UI related plugins
            ├── editor/      # Editor enhancements
            ├── lsp/         # Language Server Protocol
            ├── coding/      # Coding tools
            ├── git/         # Git integration
            ├── utils/       # Utility functions
            └── ai/          # AI coding assistance
```

### Key Mappings

- `<leader>` is set to space
- `<leader>c`: Code related commands
- `<leader>s`: Search related commands
- `<leader>f`: File/find related commands
- `<leader>u`: UI related commands
- `<leader>x`: Diagnostics and quickfix
- `<leader>g`: Git commands
- `<leader><tab>`: Tab management
- `g`: Goto commands
- `z`: Folding commands
- `<leader>b`: Buffer management

### Themes

The configuration includes support for multiple themes:

- Catppuccin
- Tokyo Night
- Rose Pine
- And more...

You can check the themes (`U`user Interface `C`olorschemes) with the command: `<leadear>uC`

To change themes, modify the theme settings in `lua/jbalibrea/ui/themes.lua`.

## License / Licencia

MIT
