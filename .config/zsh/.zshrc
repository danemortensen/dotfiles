# Run neofetch upon terminal launch
neofetch

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/settings.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

_source_if_present() {
  if [ -f "$1" ]; then
    . $1
  else
    echo "$2 not found ($1)."
  fi
}

_source_if_present $ZSH_PROMPT              "Prompt"
_source_if_present $ZSH_SYNTAX_HIGHLIGHTING "Syntax highlighting"
