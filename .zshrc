# history setup
setopt SHARE_HISTORY
SAVEHIST=3000
HISTSIZE=2999
setopt HIST_EXPIRE_DUPS_FIRST
# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(
	git
	sudo
	z
	fzf
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	zsh-history-substring-search
	you-should-use
)

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border' # fzf setting
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"

#bat to cat
alias cat='bat'
alias catori="/usr/bin/cat"

# general use
alias l='eza'
alias ls='eza --icons=always'                                                         # ls
alias ll='eza --group --header --group-directories-first --long --git --icons=always'
alias lla='ll -a'
alias la='eza -lbhHigUmuSa --icons --time-style=long-iso --git --color-scale'  # all list
alias lx='eza -lbhHigUmuSa@ --icons --time-style=long-iso --git --color-scale' # all + extended list
alias llori="/usr/bin/ls -l"

# specialty views
alias lS='eza -1 --icons'                                                       # one column, just names
alias lt='eza --tree --icons --level=2'                                         # tree

# fnm
FNM_PATH="/home/jbalibrea/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jbalibrea/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# kitty ssh
# alias s="kitten ssh"

#export DENO_INSTALL="/home/jbalibrea/.deno"
#export PATH="$DENO_INSTALL/bin:$PATH"

# alias for dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# pnpm
export PNPM_HOME="/home/jbalibrea/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# #go bin
# export PATH=$PATH:/home/jbalibrea/go/bin/
# export PATH="$PATH:/home/jbalibrea/.local/bin"

# export EDITOR=nvim # wsl2

PATH=~/.console-ninja/.bin:$PATH

eval "$(starship init zsh)"
