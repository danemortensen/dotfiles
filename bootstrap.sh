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
# Or, to run directly from GitHub:
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

# --- ANSI Color Codes ---
# Define color codes for output
readonly COLOR_RESET='\033[0m'
readonly COLOR_GREEN='\033[0;32m'   # Green for info
readonly COLOR_RED='\033[0;31m'     # Red for errors

# Logs an informational message in green.
# Arguments:
#   $1 - Message to log.
log() {
  printf "${COLOR_GREEN}[INFO] %s${COLOR_RESET}\n" "$1"
}

# Logs an error message in red to stderr and exits the script.
# Arguments:
#   $1 - Message to log to stderr before exiting.
die() {
  printf "${COLOR_RED}[ERROR] %s${COLOR_RESET}\n" "$1" >&2
  exit 1
}

install_dependencies() {
  log "Installing dependencies: ${DEPENDENCIES[*]}"
  if command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y "${DEPENDENCIES[@]}"
  elif command -v pacman &>/dev/null; then
    sudo pacman -Sy --noconfirm "${DEPENDENCIES[@]}"
  else
    die "Package manager not supported. Install git and stow manually."
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

# Function to ensure a directory exists, creating it if necessary.
# Arguments:
#   $1 - The path to the directory to check/create.
# Returns:
#   0 on success (directory exists or was created).
#   Exits the script with an error code (1) if directory creation fails.
ensure_directory_exists() {
  local dir_path="$1"

  # Check if the directory already exists
  if [ -d "$dir_path" ]; then
    log "Directory '$dir_path' already exists. Skipping creation."
    return 0
  fi

  # If it doesn't exist, try to create it
  if ! mkdir -p "$dir_path"; then
    die "Error: Failed to create directory '$dir_path'."
  fi

  log "Created directory '$dir_path'."
  return 0
}

initialize_directories() {
  log "Initializing XDG base directories..."
  ensure_directory_exists "$HOME/.config"       # XDG_CONFIG_HOME
  ensure_directory_exists "$HOME/.cache"        # XDG_CACHE_HOME
  ensure_directory_exists "$HOME/.local/share"  # XDG_DATA_HOME
  ensure_directory_exists "$HOME/.local/state"  # XDG_STATE_HOME
  return 0
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
  initialize_directories
  stow_dotfiles
  post_setup
  log "Dotfiles bootstrapped successfully!"
}

main "$@"

