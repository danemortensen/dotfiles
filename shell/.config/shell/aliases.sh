# Enable color support for ls and grep.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

# Prompt by default before overwriting/removing existing files.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -ri'

alias mkdir='mkdir -pv'

# ls
alias la='ls -A'
alias ll='ls -lAhF'

alias tree='tree -AC'

v() {
  if command -v nvim &> /dev/null; then   # 1. Try nvim
    nvim "$@"
  elif command -v vim &> /dev/null; then  # 2. Try vim
    vim "$@"
  elif command -v vi &> /dev/null; then   # 3. Try vi
    vi "$@"
  else                                    # 4. Error out
    echo "Error: No editor (nvim, vim, or vi) found in your PATH." >&2
    return 1
  fi
}

alias sudo='sudo ' # Allow sudo to work with aliases
