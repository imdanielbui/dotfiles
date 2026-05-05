# ===== OH MY ZSH =====
export ZSH="$HOME/.oh-my-zsh"

# Theme (sử dụng starship đã config trong dotfiles)
ZSH_THEME=""

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  docker
  node
  npm
  yarn
  flutter
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ===== ENVIRONMENTS =====
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ===== ALIASES =====
alias ll="eza -la"
alias la="eza -a"
alias lt="eza --tree"
alias cat="bat"

# Nvim
alias v="nvim"
alias vi="nvim"

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

# Tmux
alias t="tmux"
alias ta="tmux attach"
alias tl="tmux list-sessions"

# ===== STARSHIP =====
eval "$(starship init zsh)"

# ===== FZF =====
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d --hidden --follow"

# ===== ZSH AUTOSUGGESTIONS =====
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)
ZSH_AUTOSUGGEST_ACCEPT_LINE_KEYS=(
  ""
  ""
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_KEYS=(
  ""
  ""
)

# ===== NVM (nếu chưa load từ .zprofile) =====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ===== KITTY =====
# Để kitty có thể source theme đúng
export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty"