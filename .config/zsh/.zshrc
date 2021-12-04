# Run neofetch upon terminal launch
neofetch

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/settings.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

if [ -f "$SYNTAX_HIGHLIGHTING" ]; then
  . $SYNTAX_HIGHLIGHTING
else
  echo "Syntax highlighting ($SYNTAX_HIGHLIGHTING) not found."
fi

eval "$(starship init zsh)"
