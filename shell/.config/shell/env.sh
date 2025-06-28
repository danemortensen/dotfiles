# This file defines common environment variables to be shared between different
# shells (e.g. bash and zsh).

# ------------------------------------------------------------------------------
# XDG base directories
#
# These environment variables define standard locations for user-specific files
# and help keep your home directory clean and organized. I suggest setting these
# before this file is executed, but this provides some sensible defaults in case
# those variables have not been set already.
#
# - XDG_CONFIG_HOME: User-specific configuration files
# - XDG_CACHE_HOME: Non-essential cached data (e.g. pip wheels, web caches)
# - XDG_DATA_HOME: Persistent user data (e.g. themes, icons, Rust packages)
# - XDG_STATE_HOME: Stateful data (e.g. logs, history files, or lock files)
# ------------------------------------------------------------------------------
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_CACHE_HOME:=$HOME/.cache}"
: "${XDG_DATA_HOME:=$HOME/.local/share}"
: "${XDG_STATE_HOME:=$HOME/.local/state}"

# Set default editors
# - VISUAL: Full-screen, interactive editor (e.g. crontabl -e, git)
# - EDITOR: Basic editor or fallback (e.g. sudoedit, mail)
if command -v vim >/dev/null 2>&1; then
  export VISUAL=vim
  export EDITOR=vim
elif command -v nano >/dev/null 2>&1; then
  export VISUAL=nano
  export EDITOR=nano
else
  export VISUAL=vi
  export EDITOR=vi
fi

# Less
export LESSHISTFILE="$XDG_STATE_HOME/less/history"  # Set history location
mkdir -p "$(dirname "$LESSHISTFILE")"               # Ensure directory exists

# GO
export GOPATH="$HOME/code/go"
export GOBIN="$HOME/code/go/bin"
export PATH=$PATH:/usr/local/go/bin

# RUST
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH=$PATH:$CARGO_HOME/bin

# WEECHAT
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# if running bash
if [ -n "$BASH_VERSION" ]; then
	  . "$XDG_CONFIG_HOME/bash/bashrc"
    # include .bashrc if it exists
    if [ -f "$XDG_CONFIG_HOME/bash/bashrc" ]; then
	    . "$XDG_CONFIG_HOME/bash/bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -f "$CARGO_HOME/env" ]; then
    . "$CARGO_HOME/env"
fi

