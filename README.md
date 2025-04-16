# ✨ My Personal Dotfiles ✨

![nvim](./images/nvim.png)

![nvim2](./images/nvimff.png)

![terminal](./images/terminal.png)

- kitty config
- zsh config
- starship connfig
- tmux config
- nvim config

## Table of Contents

### [Terminal Setup](#terminal-setup)

### [Neovim Config](#neovim-config)

## Terminal Setup

- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator
- [Zsh](https://www.zsh.org/) shell
- [Starship](https://starship.rs/) prompt
- [Tmux](https://github.com/tmux/tmux) terminal multiplexer

## Neovim Config

### Requirements

- [Neovim](https://neovim.io/) (Version 0.9 or Later)
- [Nerd Font](https://www.nerdfonts.com/) - I use Iosevka Nerd Font
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope Fuzzy Finder
- Language Setup:
  - If want to write TypeScript/JavaScript, you need `node/npm`
  - If want to write Golang, you will need `go`
  - etc.

### Install Neovim

## Linux

<details><summary>Arch Install steps</summary>

```bash
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```

</details>

<details><summary>Ubuntu and/or WSL (Windows Subsystem for Linux) Install Steps</summary>

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>

## Windows

<details><summary>Windows with gcc/make using chocolatey</summary>

1. install [chocolatey](https://chocolatey.org/install)
   either follow the instructions on the page or use winget,
   run in cmd as **admin**:

```bash
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
   open a new one so that choco path is set, and run in cmd as **admin**:

```bash
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

</details>

<details><summary>Windows with WSL (Windows Subsystem for Linux)</summary>

```bash
   wsl --install
   wsl
   sudo add-apt-repository ppa:neovim-ppa/unstable -y
   sudo apt update
   sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>

## How to save dotfiles in a git repository

<details><summary>Dotfiles config alias</summary>

Recently I read about this amazing technique in an [Hacker News thread](https://news.ycombinator.com/item?id=11070797) on people's solutions to store their [dotfiles](https://en.wikipedia.org/wiki/Dot-file).

In his words the technique below requires:

No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

The technique consists in storing a [Git bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) in a "_side_" folder (like `$HOME/.cfg` or `$HOME/.myconfig`) using a specially crafted alias so that commands are run against that repository and not the usual `.git` local folder, which would interfere with any other Git repositories around.

## Starting from scratch

If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

```

- The first line creates a folder `~/.cfg` which is a [Git bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) that will track our files.
- Then we create an alias `config` which we will use instead of the regular `git` when we want to interact with our configuration repository.
- We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type `config status` and other commands later, files you are not interested in tracking will not show up as `untracked`.
- Also you can add the alias definition by hand to your `.bashrc` or use the the fourth line provided for convenience.

###### related material

After you've executed the setup any file within the `$HOME` folder can be versioned with normal commands, replacing `git` with your newly created `config` alias, like:

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

## Installing your dotfiles onto a new system (or migrate to this setup)

If you already store your configuration/dotfiles in a [Git repository](/git), on a new system you can migrate to this setup with the following steps:

- Prior to the installation make sure you have committed the alias to your `.bashrc` or `.zsh`:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

- And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```bash
echo ".cfg" >> .gitignore
```

- Now clone your dotfiles into a [bare](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) repository in a "_dot_" folder of your `$HOME`:

```bash
git clone --bare <git-repo-url> $HOME/.cfg
```

- Define the alias in the current shell scope:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

- Checkout the actual content from the bare repository to your `$HOME`:

```bash
config checkout
```

- The step above might fail with a message like:

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your `$HOME` folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

- Re-run the check out if you had problems:

```bash
config checkout
```

- Set the flag `showUntrackedFiles` to `no` on this specific (local) repository:

```bash
config config --local status.showUntrackedFiles no
```

- You're done, from now on you can now type `config` commands to add and update your dotfiles:

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

For completeness this is what I ended up with (tested on many freshly minted [Alpine Linux](http://www.alpinelinux.org/) containers to test it out):

```bash
    git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
    function config {
       /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
    }
    mkdir -p .config-backup
    config checkout
    if [ $? = 0 ]; then
      echo "Checked out config.";
      else
        echo "Backing up pre-existing dot files.";
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    fi;
    config checkout
    config config status.showUntrackedFiles no
```

[Source](https://www.atlassian.com/git/tutorials/dotfiles)

</details>

---

Thanks to [tjedeveries](https://github.com/tjdevries/) for inspiring me and making it easier and more accessible to learn Neovim - [kickstart](https://github.com/nvim-lua/kickstart.nvim/)
