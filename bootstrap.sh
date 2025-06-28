#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# bootstrap.sh — Bootstrap your dotfiles setup on a new Linux machine
#
# This script will:
#   - Install required packages using your system’s package manager
#   - Clone your dotfiles repository into ~/.dotfiles (if not already present)
#   - Symlink configuration files using GNU Stow
#   - Optionally run additional setup steps (customize in post_setup)
#
# Supported Linux distributions:
#   - Debian/Ubuntu (uses apt)
#   - Arch/Manjaro (uses pacman)
#
# Requirements:
#   - sudo privileges
#   - Internet access to clone the Git repo and install packages
#
# Customize:
#   - Add or remove dependencies in the DEPENDENCIES array
#   - Add extra setup commands in the post_setup() function
#
# Usage:
#   chmod +x bootstrap.sh
#   ./bootstrap.sh
#
# Or, to run directly from GitHub (optional, if you host this file):
#   bash <(curl -sL https://raw.githubusercontent.com/danemortensen/dotfiles/main/bootstrap.sh)
#
# -----------------------------------------------------------------------------
# Disclaimer:
#   This script is minimally tested and may not handle all edge cases. Use at
#   your own risk. Review and modify it to suit your specific setup before
#   running it on a new machine.
# -----------------------------------------------------------------------------
#
# Author: Dane Mortensen
# -----------------------------------------------------------------------------

set -euo pipefail

# CONFIGURATION
REPO_URL="https://github.com/danemortensen/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
DEPENDENCIES=(git stow vim)

# COLORS FOR MESSAGES
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# FUNCTIONS
log() {
  echo -e "${GREEN}==> $1${NC}"
}

install_dependencies() {
  log "Installing dependencies: ${DEPENDENCIES[*]}"
  if command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y "${DEPENDENCIES[@]}"
  elif command -v pacman &>/dev/null; then
    sudo pacman -Sy --noconfirm "${DEPENDENCIES[@]}"
  else
    echo "Package manager not supported. Install git and stow manually." >&2
    exit 1
  fi
}

clone_dotfiles_repo() {
  if [ -d "$DOTFILES_DIR" ]; then
    log "Dotfiles directory already exists at $DOTFILES_DIR. Skipping clone."
  else
    log "Cloning dotfiles into $DOTFILES_DIR..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
  fi
}

stow_dotfiles() {
  log "Symlinking dotfiles using stow..."
  cd "$DOTFILES_DIR"
  for dir in */; do
    [ -d "$dir" ] && stow -v "$dir"
  done
}

# OPTIONAL: add any extra setup here
post_setup() {
  log "Running any post-setup steps..."
  # Examples:
  # source ~/.zshrc
  # install custom fonts
  # setup local bin tools
}

main() {
  install_dependencies
  clone_dotfiles_repo
  stow_dotfiles
  post_setup
  log "Dotfiles bootstrapped successfully!"
}

main "$@"

