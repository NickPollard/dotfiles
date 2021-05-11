# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

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

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# git
export GIT_EDITOR="nvim"
alias gs="git status -s"
alias gl="git log -30"
alias co="git checkout"
alias ff="git merge --ff-only"
alias gds="git diff --stat"
alias gb="git branch --format \"%(align:position=left,width=24)%(color:blue)%(authordate:relative)%(end)%(align:position=left,width=42)%(color:bold red)%(refname:short)%(end)%(color:nobold #808080)%(subject)\""

alias sz="source ~/.zshrc"
alias vz="nvim ~/.zshrc"
alias vi="nvim"
alias vim="nvim"

alias ls="ls -al --color=auto"

# Use ripgrep
alias grep="rg"

export RUST_SRC_PATH="$HOME/rust/src"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/depot_tools

source ~/.zshrc.local

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

function fuchsia_dev {
  if [[ "${IN_FUCHSIA_TREE}" -eq 1 ]]
  then
    _PROMPT_BOARD="$(cat ~/fuchsia/.fx-build-dir | cut -b 5-)"
    _PROMPT_BUILD_DIR="~/fuchsia/$(cat ~/fuchsia/.fx-build-dir)"
    _PROMPT_DEVICE="$(cat ${_PROMPT__BUILD_DIR}/.device 2>/dev/null || echo '<none>')"
    echo "%{$fg_bold[magenta]%}${_PROMPT_BOARD}/${_PROMPT_DEVICE}%{$reset_color%} "
  fi
}

# Different colors for different hostnames
function host_color {
    case $(prompt_hostname) in
      boxleitner) echo cyan ;;
      nickpollard1) echo yellow ;;
      clu1) echo red ;;
      *) echo default ;;
    esac
}

function prompt_hostname {
  hostname | cut -f1 -d.
}

PROMPT='${ret_status} %{$fg_bold[green]%}$(prompt_hostname)%{$reset_color%} %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)%{$reset_color%}$(fuchsia_dev)$ '
PROMPT="%{$fg[$(host_color)]%}%m%{$reset_color%} ${PROMPT}"


# Use `direnv` to allow local environment setting via `.envrc` files
eval "$(direnv hook zsh)"
