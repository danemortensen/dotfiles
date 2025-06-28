# This file defines common environment variables to be shared between different
# shells (e.g. bash and zsh). Note that XDG base directories should already be
# set when this file is executed.

# EDITOR
export EDITOR="nvim"
export VISUAL="nvim"

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
