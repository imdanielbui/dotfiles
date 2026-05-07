#!/bin/bash
# Dotfiles Install Script
# Recreates symlinks and installs required tools

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "==> Dotfiles directory: $DOTFILES_DIR"
echo "==> Backup directory: $BACKUP_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up: $dest -> $BACKUP_DIR/"
        cp -r "$dest" "$BACKUP_DIR/" 2>/dev/null || true
        rm -rf "$dest"
    fi
    
    ln -s "$src" "$dest"
    echo "Linked: $dest -> $src"
}

# 1. Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "==> Oh My Zsh already installed"
fi

# 2. Install Oh My Zsh plugins
echo "==> Installing Oh My Zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 3. Install Homebrew packages if missing
echo "==> Checking Homebrew packages..."
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install it first: https://brew.sh/"
    exit 1
fi

PACKAGES=("zoxide" "eza" "bat" "fzf" "starship" "neovim" "kitty" "tmux" "git")
for pkg in "${PACKAGES[@]}"; do
    if ! brew list "$pkg" &> /dev/null; then
        echo "Installing: $pkg"
        brew install "$pkg"
    else
        echo "Already installed: $pkg"
    fi
done

# 4. Create symlinks
echo "==> Creating symlinks..."

# .zshrc
link_file "$DOTFILES_DIR/zshrc/.zshrc" "$HOME/.zshrc"

# .gitconfig
if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

# .config directory
mkdir -p "$HOME/.config"

# nvim
link_file "$DOTFILES_DIR/nvim/.config/nvim" "$HOME/.config/nvim"

# kitty
link_file "$DOTFILES_DIR/kitty/.config/kitty" "$HOME/.config/kitty"

# tmux
link_file "$DOTFILES_DIR/tmux/.config/tmux" "$HOME/.config/tmux"
if [ -f "$DOTFILES_DIR/tmux/.config/tmux/tmux.conf" ]; then
    link_file "$DOTFILES_DIR/tmux/.config/tmux/tmux.conf" "$HOME/.tmux.conf"
fi

# starship
link_file "$DOTFILES_DIR/starship/.config/starship.toml" "$HOME/.config/starship.toml"

# Other configs (only if they exist in dotfiles)
for dir in karabiner opencode raycast cagent flutter github-copilot; do
    if [ -d "$DOTFILES_DIR/$dir/.config/$dir" ]; then
        link_file "$DOTFILES_DIR/$dir/.config/$dir" "$HOME/.config/$dir"
        echo "Linked: $dir"
    fi
done

# 5. Set up TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "==> Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# 6. Initialize zoxide
if command -v zoxide &> /dev/null; then
    echo "==> Initializing zoxide..."
    zoxide init zsh > /dev/null 2>&1 || true
fi

echo ""
echo "==> Installation complete!"
echo "==> Backup of old files: $BACKUP_DIR"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Inside tmux, press Ctrl+a then I (capital i) to install tmux plugins"
echo "3. For neovim, run: nvim and then :Lazy sync"
