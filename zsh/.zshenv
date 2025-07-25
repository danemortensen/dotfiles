#
# .zshenv
#
# This file is sourced by every instance of Zsh, including login, non-login,
# interactive, and non-interactive shells. It should be used only to set
# environment variables that are required universally (e.g. PATH, EDITOR,
# XDG variables, language settings).
#
# Avoid putting shell-specific logic, aliases, functions, or anything that
# produces output or relies on interactivity, as this file is also sourced
# in script and remote command contexts.
#
# Use ~/.zshrc for interactive shell configuration,
# and ~/.zprofile for login shell setup.

# ------------------------------------------------------------------------------
# XDG Base Directory Specification
#
# These environment variables define standard locations for user-specific files
# and help keep your home directory clean and organized.
#
# - XDG_CONFIG_HOME: User-specific configuration files.
# - XDG_CACHE_HOME: Non-essential cached data (e.g. pip wheels, web caches).
# - XDG_DATA_HOME: Persistent user data (e.g. themes, icons, Rust packages).
# - XDG_STATE_HOME: Stateful data (e.g. logs, history files, or lock files).
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh-specific environment variables.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_PLUGIN_DIR="$ZDOTDIR/plugins"
export ZSH_PROMPT="$ZSH_PLUGIN_DIR/prompt.zsh"
export ZSH_SYNTAX_HIGHLIGHTING="$ZSH_PLUGIN_DIR/syntax-highlighting.zsh"

# ------------------------------------------------------------------------------
#
# History-related environment variables.
#
# ------------------------------------------------------------------------------
export HISTFILE="$XDG_STATE_HOME/zsh/history"   # Set history file location.
mkdir -p "${HISTFILE:h}"                        # Create history directory.
export HISTSIZE=10000                         # Save 10K lines during session.
export SAVEHIST=10000                         # Save 10K lines across sessions.

# Set common environment variables.
[[ -f $XDG_CONFIG_HOME/shell/env.sh ]] && . $XDG_CONFIG_HOME/shell/env.sh

