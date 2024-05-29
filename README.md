# 🚀 jbalibrea dotfiles

![nvim](./images/nvim.png)

![nvim2](./images/nvimff.png)

![terminal](./images/terminal.png)

- nvim config
- tmux config
- kitty config
- i3
- picom

## Neovim conf

### Requirements

- [Neovim](https://neovim.io/) (Version 0.9 or Later)
- [Nerd Font](https://www.nerdfonts.com/) - I use JetBrainsMono Nerd Font
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope Fuzzy Finder
- Language Setup:
  - If want to write TypeScript/JavaScript, you need `node/npm`
  - If want to write Golang, you will need `go`
  - etc.

### Install Neovim

<details><summary>Ubuntu and/or WSL (Windows Subsystem for Linux) Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>

<details><summary>Windows with gcc/make using chocolatey</summary>

1. install [chocolatey](https://chocolatey.org/install)
   either follow the instructions on the page or use winget,
   run in cmd as **admin**:

```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
   open a new one so that choco path is set, and run in cmd as **admin**:

```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

</details>

---

Thanks to [tjedeveries](https://github.com/tjdevries/) for inspiring me and making it easier and more accessible to learn Neovim - [kickstart](https://github.com/nvim-lua/kickstart.nvim/)
