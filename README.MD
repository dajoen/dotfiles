# Dotfiles

Personal workstation configuration managed with [chezmoi](https://www.chezmoi.io/). Captures shell, editor, tooling, and system preferences in a reproducible, host‑aware way (Fedora 42, macOS, Ubuntu WSL).

Repo: https://github.com/dajoen/dotfiles

## Features
- Host / OS aware templating
- Idempotent apply & safe diffs
- Bootstrap scripts (dnf / brew / apt)
- Optional encrypted secrets (age / gpg / 1Password / pass)
- One‑liner fresh machine setup

## Prerequisites
- git
- chezmoi (https://www.chezmoi.io/install/)
- Optional secrets backend: age | gpg | 1Password | pass

### Install chezmoi quickly
Fedora:
```sh
sudo dnf install chezmoi
```
Ubuntu (WSL):
```sh
sudo apt update && sudo apt install -y chezmoi
```
macOS:
```sh
brew install chezmoi
```

## Quick Start (fresh machine)
```sh
# SSH
chezmoi init git@github.com:dajoen/dotfiles.git
# or HTTPS
chezmoi init https://github.com/dajoen/dotfiles.git

chezmoi diff
chezmoi apply
```

## One‑liner Bootstrap
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply dajoen
```

## Daily Use
```sh
chezmoi edit ~/.zshrc
chezmoi update      # pull + apply
chezmoi diff
chezmoi apply
```

## Repository Conventions
| Pattern | Result |
|---------|--------|
| dot_zshrc | ~/.zshrc |
| dot_config/app/file | ~/.config/app/file |
| templates/ | go template partials |
| run_once_* | Executes only first apply |
| exec_* | Runs every apply (idempotent) |
| private_* / *.age | Encrypted material |

## Secrets
Never commit plaintext credentials.
```sh
chezmoi secret add age key.txt
```
See: `chezmoi help secrets`.

## Adding Files
```sh
chezmoi add ~/.gitconfig
chezmoi edit ~/.gitconfig
chezmoi diff
chezmoi apply
```

## Host / OS Specific Logic
```tmpl
{{ if eq .chezmoi.os "linux" }}# Linux specific{{ end }}
{{ if eq .chezmoi.osRelease.id "fedora" }}# Fedora tweak{{ end }}
{{ if eq .chezmoi.osRelease.id "ubuntu" }}# Ubuntu tweak{{ end }}
{{ if eq .chezmoi.os "darwin" }}# macOS specific{{ end }}
{{ if eq .chezmoi.hostname "workstation" }}# host specific{{ end }}
```

## Scripts
- Prefer POSIX sh.
- Make installs idempotent.
- Detect platform:
```sh
case "$(uname -s)" in
    Linux) PM=$(command -v dnf || command -v apt) ;;
    Darwin) PM=brew ;;
esac
```

## Package Install Example
```sh
if ! command -v fd >/dev/null 2>&1; then
    if command -v dnf >/dev/null 2>&1; then sudo dnf install -y fd-find
    elif command -v apt >/dev/null 2>&1; then sudo apt install -y fd-find
    elif command -v brew >/dev/null 2>&1; then brew install fd
    fi
fi
```

## Troubleshooting
```sh
chezmoi doctor
chezmoi diff --exclude=encrypted
```

## Contributing
Branch, keep scripts minimal, document platform assumptions.

## CI/CD

This repository uses GitHub Actions to automatically test the dotfiles configuration across multiple operating systems and environments:

- **Basic Tests**: Tests the configuration on Ubuntu, Fedora, and macOS
- **Matrix Tests**: Tests on multiple versions of Ubuntu, macOS, Fedora, and Debian
- **WSL Tests**: Tests specifically for Ubuntu WSL compatibility

The CI pipeline validates that:
- All essential configuration files are created correctly
- ZSH configuration loads without errors
- Tool-specific configurations are valid
- Required tools are available

To run the tests manually, trigger the workflows from the GitHub Actions tab.

## License
MIT (adjust if needed)

Refs: https://www.chezmoi.io/ • https://www.chezmoi.io/user-guide/templating/

Automate. Templatize. Keep secrets safe.