# Run neofetch upon terminal launch
neofetch

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/settings.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
