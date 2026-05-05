# Dotfiles - macOS Development Environment

Modern dotfiles setup optimized for AI Agent development workflow (OpenCode, Claude Code, Cursor, etc.)

## 🎯 Features

- **Zsh + Oh My Zsh** - Enhanced shell with plugins (autosuggestions, syntax highlighting)
- **Starship** - Fast, customizable cross-shell prompt with Catppuccin Mocha theme
- **Zoxide** - Smarter cd command with fuzzy finding
- **Tmux** - Terminal multiplexer with Catppuccin theme and vim integration
- **Neovim** - Modern text editor with Lazy.nvim, Telescope, Treesitter, LSP
- **Kitty** - GPU-accelerated terminal with Nerd Fonts support
- **Eza + Bat + Fzf** - Modern replacements for ls, cat, and fuzzy finding

## 📁 Structure

```
dotfiles/
├── zshrc/.zshrc                    # Zsh configuration
├── nvim/.config/nvim/              # Neovim configuration
├── kitty/.config/kitty/            # Kitty terminal config
├── tmux/.config/tmux/              # Tmux configuration
├── starship/.config/starship.toml  # Starship prompt config
├── karabiner/.config/karabiner/    # Karabiner Elements config
├── opencode/.config/opencode/      # OpenCode config
├── raycast/.config/raycast/        # Raycast config
├── cagent/.config/cagent/          # Cagent config
├── flutter/.config/flutter/        # Flutter config
├── github-copilot/.config/github-copilot/  # GitHub Copilot config
├── git/.gitconfig                  # Git global config
├── install.sh                      # Automated install script
└── AI-AGENT-WORKFLOW-GUIDE.md      # Vietnamese workflow guide
```

## 🚀 Quick Start

### Fresh Install
```bash
git clone https://github.com/imdanielbui/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Update Symlinks Only
```bash
cd ~/dotfiles
./install.sh
```

## ⌨️ Key Workflows

### AI Agent Development (Recommended Tmux Layout)
```bash
# Create new tmux session with smart directory detection
tm

# Or manually:
tmux new-session -s myproject
# Ctrl+s | to split vertically
# Ctrl+s - to split horizontally
```

**Suggested 3-pane layout:**
- **Pane 1 (left)**: Neovim for coding
- **Pane 2 (right top)**: AI Agent (opencode, claude, etc.)
- **Pane 3 (right bottom)**: Terminal for commands/tests

### Quick Navigation
```bash
z my_project      # Jump to frequently used directory
zi                 # Fuzzy find from zoxide database
ls                 # Modern ls with icons (eza)
ll                 # Detailed list with git status
bat file.txt       # Syntax-highlighted file view
```

### Git Shortcuts
```bash
gs   # git status
ga   # git add
gc   # git commit -m
gp   # git push
gl   # git log --oneline --graph
```

## 📝 Key Bindings

### Tmux (Prefix: Ctrl+s)
| Shortcut | Action |
|----------|--------|
| `Ctrl+s` r | Reload config |
| `Ctrl+s` h/j/k/l | Navigate panes |
| `Ctrl+s` \| | Split vertically |
| `Ctrl+s` - | Split horizontally |
| `Ctrl+s` d | Detach session |

### Kitty
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+t` | New tab |
| `Ctrl+Shift+w` | Close tab |
| `Ctrl+Shift+c` | Copy |
| `Ctrl+Shift+v` | Paste |

## 🔧 Post-Install Steps

1. **Restart terminal** or run `source ~/.zshrc`
2. **Install tmux plugins**: Inside tmux, press `Ctrl+s` then `I` (capital i)
3. **Sync Neovim plugins**: Run `nvim` then `:Lazy sync`
4. **Train zoxide**: Navigate to directories, then use `z` to jump

## 📖 Documentation

For detailed Vietnamese guide with AI Agent workflows, see:
- [AI-AGENT-WORKFLOW-GUIDE.md](./AI-AGENT-WORKFLOW-GUIDE.md)

## 🎨 Themes

- **Starship**: Catppuccin Mocha
- **Tmux**: Catppuccin (via TPM plugin)
- **Kitty**: Catppuccin Mocha (included theme file)
- **Terminal Font**: CaskaydiaCove Nerd Font Mono

## 🛠 Requirements

- macOS
- Homebrew
- Git
- Internet connection (for initial setup)

Tools that will be installed via Homebrew:
- zoxide, eza, bat, fzf, starship, neovim, kitty, tmux

## 📦 Backup

Old configurations are automatically backed up to `~/.dotfiles-backup-YYYYMMDD-HHMMSS/` when running `install.sh`.

## 🔄 Updating

1. Edit configs in `~/dotfiles/` directory
2. Changes automatically apply (symlinks)
3. Commit and push to GitHub:
   ```bash
   cd ~/dotfiles
   git add .
   git commit -m "Update configs"
   git push
   ```

## 📝 License

MIT

## 🙏 Credits

- Forked from [typecraft-dev/dotfiles](https://github.com/typecraft-dev/dotfiles)
- Oh My Zsh plugins: zsh-autosuggestions, zsh-syntax-highlighting
- Tmux plugins: TPM, vim-tmux-navigator, catppuccin/tmux
