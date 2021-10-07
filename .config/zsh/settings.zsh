# HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# PUSHD
setopt AUTO_PUSHD        # Push current directory onto stack
setopt PUSHD_IGNORE_DUPS # Do not store duplicates on stack
setopt PUSHD_SILENT      # Do not print stack after push or pop

# VI MODE
bindkey -v          # Enable vi mode
export KEYTIMEOUT=1 # Key timeout of 10ms
