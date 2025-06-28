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

alias ll='ls -lAhF'
alias tree='tree -AC'
alias v='nvim'

alias sudo='sudo ' # Allow sudo to work with aliases
