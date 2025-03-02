alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias d='dirs -v' # View directories in stack

alias e=$EDITOR

# GIT
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

alias ls='ls --color'
alias la='ls -a'
alias ll='ls -la'

alias rm='rm -i' # Prompt by default before removing

alias sudo='sudo ' # Allow sudo to work with aliases
