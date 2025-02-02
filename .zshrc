setopt NO_CASE_GLOB
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt PROMPT_SUBST
setopt AUTO_CD
setopt AUTO_PUSHD

# ====== Prompt ======
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' %F{242}git:(%b)%f%F{green}%c%f%F{yellow}%u%f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
PROMPT='%B%F{%(?.blue.red)}%1~%f%b$vcs_info_msg_0_ '

# ====== Completion ======
# Colors for directories, ls, cd, etc.
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30' && export CLICOLOR=1
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
# Completion menu
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete
autoload -U select-word-style
select-word-style bash
# Support bash completions
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# For Csharpier to work with conform and dotnet installed via brew
# might work out of the box if dotnet installed from web
if [[ -d "/opt/homebrew/opt/dotnet"  ]]
then
  export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
fi

# ===== VIPPS =====
[ -f "$HOME/vipps/checkout-frontend-envs.sh" ] && source "$HOME/vipps/checkout-frontend-envs.sh"

# Tools config
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
# [ -x "$(command -v ngrok)" ] && eval "$(ngrok completion)"
[ -x "$(command -v fzf)" ] && source <(fzf --zsh)

[ -x "$(command -v n)" ] && export N_PREFIX="$HOME/.n"

# TODO: set up site functions
# e.g. /opt/homebrew/share/zsh/site-functions

if [[ -d "$HOME/.zsh" ]]
then
  source "$HOME/.zsh/alias.zsh"
  source "$HOME/.zsh/git.zsh"
  source "$HOME/.zsh/function.zsh"
fi

PATH="$PATH:/opt/homebrew/bin:$HOME/.n/bin:$HOME/.local/bin"
