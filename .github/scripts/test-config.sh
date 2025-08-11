#!/bin/bash
# test-config.sh - Script to test the dotfiles configuration

set -e  # Exit on error

echo "Running dotfiles configuration tests..."

# Test 1: Verify that essential dotfiles exist
echo "Test: Essential dotfiles existence"
for file in ~/.zshenv ~/.zshrc ~/.config/starship.toml ~/.config/wezterm/wezterm.lua; do
  if [ -f "$file" ]; then
    echo "✓ $file exists"
  else
    echo "✗ $file missing"
    exit 1
  fi
done

# Test 2: Verify zsh configuration loads
echo "Test: ZSH configuration"
if zsh -c 'source ~/.zshenv && source ~/.zshrc && echo "ZSH OK" > /dev/null 2>&1'; then
  echo "✓ ZSH configuration loads without errors"
else
  echo "✗ ZSH configuration has errors"
  exit 1
fi

# Test 3: Verify that starship configuration is valid
if command -v starship > /dev/null; then
  echo "Test: Starship configuration"
  if starship config ~/.config/starship.toml > /dev/null 2>&1; then
    echo "✓ Starship configuration is valid"
  else
    echo "✗ Starship configuration is invalid"
    exit 1
  fi
else
  echo "⚠ Starship not installed, skipping test"
fi

# Test 4: Check for common tools referenced in dotfiles
echo "Test: Required tools installation"
for cmd in git curl zsh starship; do
  if command -v $cmd > /dev/null 2>&1; then
    echo "✓ $cmd is available"
  else
    echo "⚠ $cmd is not installed"
  fi
done

echo "All tests completed successfully!"
