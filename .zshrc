# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias sz="source ~/.zshrc"
alias vz="nvim ~/.zshrc"
alias vzl="nvim ~/.zshrc.local"
alias vi="nvim"
alias vim="nvim"

alias ls="ls -al --color=auto"

# Use ripgrep
alias grep="rg"

# Path
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/depot_tools

source ~/.zshrc.local

source ~/.zsh/bat.zshrc

source ~/.zsh/git.zshrc
source ~/.zsh/prompt.zshrc
source ~/.zsh/rust.zshrc

# Use `direnv` to allow local environment setting via `.envrc` files
# eval "$(direnv hook zsh)"

# prefix history search on up (and down) keys
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search
# bindkey "^[[B" down-line-or-beginning-search

# Make zsh autocomplete with up arrow
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

# To make Vim colorschemes display correctly within tmux
export TERM=xterm-256color
