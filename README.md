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

These instructions assume you are using **Arch Linux**. If you are on a different distribution (like Ubuntu or Fedora), you will need to use your system's package manager (e.g., `apt` or `dnf`) instead of `pacman`.

1.  **Install required packages**:
    Open your terminal and run the following command. You may be asked for your password.

    ```bash
    sudo pacman -S git zsh neovim bat btop firefox
    ```

2.  **Install `chezmoi`**:
    This is the tool used to manage these configuration files.

    ```bash
    sudo pacman -S chezmoi
    ```

## Installation

To set up your machine, run the following command.

```bash
chezmoi init --apply dajoen
```

**What this does:**
*   It downloads the configuration files from GitHub: `https://github.com/dajoen/dotfiles`.
*   It applies them to your home directory.

*(Note: `dajoen` is my GitHub username. Chezmoi automatically looks for a repository named `dotfiles` under that user.)*

## Post-Installation

Most things should work automatically, but here is what happens in the background:

### Zsh & Zimfw
When you open `zsh` for the first time, the plugin manager (`zimfw`) will automatically install plugins like syntax highlighting and autosuggestions.

If something looks wrong, you can force an update by running:
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
