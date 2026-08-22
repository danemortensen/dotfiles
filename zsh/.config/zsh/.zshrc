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

unsetopt BEEP   # Turn off the bell!



# ==============================================================================
# Aliases
# ==============================================================================

alias la="ls -A"
alias ll="ls -lAhF"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -ri"

alias mkdir="mkdir -pv"

alias v="nvim"

alias sudo="sudo "

PROMPT="%F{green}%n@%m%f %B%F{blue}%~%f%b %# "

if (( $+commands[fastfetch] )); then    # First, try to run fastfetch
  fastfetch
elif (( $+commands[neofetch] )); then   # If that doesn't work, try neofetch
  neofetch
fi

# Plugins
if [[ -r ~/.local/opt/antidote/antidote.zsh ]]; then
  export ANTIDOTE_HOME="$XDG_DATA_HOME/antidote"
  source ~/.local/opt/antidote/antidote.zsh
  zstyle ':antidote:bundle' file "$ZDOTDIR/plugins.txt"
  zstyle ':antidote:static' file "$XDG_STATE_HOME/zsh/plugins.zsh"
  antidote load
fi

