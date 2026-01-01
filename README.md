# Dotfiles

These are my personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## Features

- **Shell**: Zsh managed with [Zim](https://github.com/zimfw/zimfw).
- **Prompt**: [Starship](https://starship.rs/) with Nerd Fonts v3 icons.
- **Editor**: [Neovim](https://neovim.io/) based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
- **Terminal Utilities**:
  - `bat` with Catppuccin Mocha theme.
  - `btop` with Catppuccin Mocha theme.
- **Browser**: Firefox configured with [arkenfox/user.js](https://github.com/arkenfox/user.js).

## Prerequisites

Ensure you have the following installed on your system (Arch Linux assumed):

```bash
sudo pacman -S git zsh neovim bat btop firefox
```

Install `chezmoi`:

```bash
sudo pacman -S chezmoi
```

## Installation

Initialize and apply the dotfiles:

```bash
chezmoi init --apply dajoen
```

## Post-Installation

### Zsh & Zimfw
On the first launch of `zsh`, `zimfw` should automatically install the missing modules defined in `.zimrc`. If not, run:

```zsh
zimfw install
```

### Neovim
Neovim configuration is pulled as an external repository. On first launch, `lazy.nvim` will install all plugins.

### Firefox
A `run_once` script is included to download the `arkenfox/user.js` configuration to your default Firefox profile.

## Structure

- `~/.config/nvim`: External repo (kickstart.nvim fork).
- `~/.config/zsh`: Zsh configuration.
- `~/.config/bat`: Bat configuration and themes.
- `~/.config/btop`: Btop configuration and themes.
