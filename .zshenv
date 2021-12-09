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
. "$CARGO_HOME/env"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_PLUGIN_DIR="$ZDOTDIR/plugins"
export ZSH_PROMPT="$ZSH_PLUGIN_DIR/prompt.zsh"
export ZSH_SYNTAX_HIGHLIGHTING="$ZSH_PLUGIN_DIR/syntax-highlighting.zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# WEECHAT
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
