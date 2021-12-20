# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

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
if [ -f "$CARGO_HOME/env" ]; then
    . "$CARGO_HOME/env"
fi

# WEECHAT
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

