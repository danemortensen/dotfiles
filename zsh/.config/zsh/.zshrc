#
# .zshrc
#
# This file is sourced by interactive Zsh shells and is intended for configuring
# interactive shell behavior. Use this file to define:
#
# - Aliases
# - Shell options (setopt/unsetopt)
# - Prompt configuration
# - Plugin or theme loading
# - Interactive-only environment setup (e.g. fzf, direnv, key bindings)
#
# This file is not sourced by non-interactive or script shells. For universal
# environment variables or script-safe settings, use ~/.zshenv instead.
#
# Avoid placing long-running commands or side-effect-heavy logic here, as it
# runs on every new interactive shell.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History settings
setopt append_history       # Don't overwrite history file
setopt hist_ignore_dups     # Don't record duplicate lines
setopt inc_append_history   # Write to history file immediately
setopt share_history        # Share history across all shells

[[ -f $XDG_CONFIG_HOME/shell/aliases.sh ]] && . $XDG_CONFIG_HOME/shell/aliases.sh

PROMPT="%F{green}%n@%m%f %B%F{blue}%~%f%b %# "

fastfetch

