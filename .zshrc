# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse"

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Because slow startup time?
DISABLE_AUTO_UPDATE="true"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Node version manager (NVM)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# --------------------------------------------------------
# --- Aliases
# --------------------------------------------------------
alias zshconfig="$EDITOR ~/.zshrc"
alias v=$EDITOR
alias f=fzf

# Linux specific
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
if [[ "$UNAME" == "linux" ]]
then
  alias bat="batcat" # Apt installes bat as batcat
fi

# For Csharpier to work with conform and dotnet installed via brew
# might work out of the box if dotnet installed from web
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# --------------------------------------------------------
# --- Custom functions
# --------------------------------------------------------
# Cd and ls
function cs () {
	cd "$@" && ls -al
}

# --------------------------------------------------------
# --- Homebrew Mac ARM
# --------------------------------------------------------
if [[ -d "/opt/homebrew/bin" ]]
then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# --------------------------------------------------------
# --- jenv
# --------------------------------------------------------
if [ -x "$(command -v jenv)" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
fi

# alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

# --------------------------------------------------------
# --- Deno
# --------------------------------------------------------
# export PATH="$HOME/.deno/bin:$PATH"

# --------------------------------------------------------
# --- VS CODE
# --------------------------------------------------------
# export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# --------------------------------------------------------
# --- VIPPS
# --------------------------------------------------------
[ -f "$HOME/vipps/checkout-frontend-envs.sh" ] && source "$HOME/vipps/checkout-frontend-envs.sh"

# Tools config
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
[ -x "$(command -v ngrok)" ] && eval "$(ngrok completion)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
