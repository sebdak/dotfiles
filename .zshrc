# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

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
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# --------------------------------------------------------
# --- Aliases
# --------------------------------------------------------
alias zshconfig="vim ~/.zshrc"
alias spotify="spotify --force-device-scale-factor=2.0 %U"
alias v="nvim"
alias gits="git status"
alias gitd="git diff"
alias gita="git add -A"
alias gitc="git commit -m "
alias gitp="git push"
alias gitl="git log --all --decorate --oneline --graph"

# Linux specific
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
if [[ "$UNAME" == "linux" ]]
then
  alias bat="batcat" # Apt installes bat as batcat
fi

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

function ibrew() {
   arch --x86_64 /usr/local/bin/brew $@
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# --------------------------------------------------------
# --- jenv
# --------------------------------------------------------
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

# --------------------------------------------------------
# --- Deno
# --------------------------------------------------------
export PATH="$HOME/.deno/bin:$PATH"


# --------------------------------------------------------
# --- GCLOUD
# --------------------------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


# --------------------------------------------------------
# --- KUBECONFIG
# --------------------------------------------------------
export KUBECONFIG="$HOME/dev/nav/kubeconfigs/config"
