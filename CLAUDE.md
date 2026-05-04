# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **Chezmoi-managed macOS dotfiles repository**. Chezmoi handles all file deployment — there are no install scripts or Makefiles.

## Applying Changes

```bash
chezmoi apply            # deploy all dotfiles to home directory
chezmoi diff             # preview what would change
chezmoi add ~/.somefile  # track a new file
```

## Chezmoi Filename Conventions

Chezmoi decodes repository filenames into destination paths using prefixes:

| Prefix | Effect |
|--------|--------|
| `dot_` | Becomes `.` in the filename (e.g. `dot_gitconfig` → `~/.gitconfig`) |
| `private_` | Deployed with mode 0600 |
| `symlink_` | Deployed as a symlink rather than a copy |
| `dot_config/` | Maps to `~/.config/` |

Prefixes can be combined: `private_dot_zshrc` → `~/.zshrc` (mode 0600).

## Architecture

### Shell Stack
- **Zsh** with **Zim** framework (`private_dot_zimrc`) — migrated from Oh-My-Zsh
- `private_dot_zshrc` initializes Zim, sets history options, and configures keybindings
- **Starship** prompt (`dot_config/starship.toml`) — shows azure, kubernetes, time, and sudo contexts

### Terminal Emulators
- **Kitty** (`dot_config/kitty/`) — primary terminal; FiraCode Nerd Font 14pt, Nord theme via `theme.conf`, custom tab bar in `tab_bar.py`
- **WezTerm** (`dot_config/wezterm/wezterm.lua`) — Lua-based config; same Nord + FiraCode setup at 16pt, with custom keybinds and background images

### Multiplexers
- **Zellij** (`dot_config/zellij/config.kdl`) — primary multiplexer; vim-style keybindings, Nord theme defined inline
- **Tmux** (`dot_tmux.conf`) — managed via tpm; Nord theme via `nord-tmux` plugin

### Theme Consistency
All tools use the **Nord** color scheme (arctic blue palette). When adding config for a new tool, use Nord colors.

### External Resources
`.chezmoiexternal.toml` downloads and refreshes (weekly) resources that are not committed directly:
- Zsh plugins (zsh-syntax-highlighting, zsh-autosuggestions)
- Neovim kickstart config (from `github.com/dajoen/kickstart.nvim`)

### Git Config
`dot_gitconfig` enables GPG-signed commits and Git Credential Manager with an Azure DevOps credential store.
