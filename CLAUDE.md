# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **Chezmoi-managed cross-platform dotfiles repository** supporting macOS and Linux. Chezmoi handles all file deployment — there are no install scripts or Makefiles.

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

Files ending in `.tmpl` are Chezmoi templates. Use `{{ if eq .chezmoi.os "darwin" }}` / `{{ else }}` / `{{ end }}` for OS-specific sections. `.chezmoiignore.tmpl` controls which files are skipped per platform (e.g. Kitty is excluded on Linux).

## Architecture

### Shell Stack
- **Zsh** with **Zim** framework (`private_dot_zimrc`) — both platforms use `~/.zshrc` / `~/.zimrc`
- `private_dot_zshrc.tmpl` initializes Zim; Linux adds Zellij auto-start and Rust PATH via template block

### Terminal Emulators
- **Kitty** (`dot_config/kitty/`) — macOS only; FiraCode Nerd Font 14pt, Nord theme via `private_current-theme.conf`, custom tab bar in `tab_bar.py`
- **WezTerm** (`dot_config/wezterm/wezterm.lua.tmpl`) — template; macOS gets background image + 14pt, Linux gets linuxbrew zsh default + 12pt

### Multiplexers
- **Zellij** (`dot_config/zellij/config.kdl`) — primary multiplexer; vim-style keybindings, Nord theme defined inline
- **Tmux** (`dot_tmux.conf`) — managed via tpm; Nord theme via `nord-tmux` plugin

### Theme Consistency
All tools use the **Nord** color scheme (arctic blue palette). When adding config for a new tool, use Nord colors.

### External Resources
`.chezmoiexternal.toml` manages resources not committed directly:
- **tpm** (`git-repo` → `~/.tmux/plugins/tpm`) — Tmux plugin manager; installs `nord-tmux` and `tmux-sensible` via `prefix + I`

### Neovim
`dot_config/nvim` is a git submodule pointing to the personal fork `dajoen/kickstart.nvim`. Custom additions live entirely in `lua/custom/`:
- `lua/custom/options.lua` — tab width (4 spaces), relative line numbers
- `lua/custom/plugins/copilot.lua` — GitHub Copilot
- `lua/custom/plugins/codecompanion.lua` — CodeCompanion AI assistant

The only modified upstream file is `lua/kickstart/plugins/neo-tree.lua` (auto-open on startup).

### Git Config
`dot_gitconfig.tmpl` enables GPG-signed commits and Git Credential Manager. Credential store is OS-specific: `keychain` on macOS, `secretservice` on Linux.

## Git Workflow

Make small, focused commits after each logical change rather than bundling everything at the end. Each commit should be self-contained and describe one thing. Push to remote at the end of the session.
