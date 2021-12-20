# Dotfiles
These are the personal configuration files I use in my day-to-day workflow. Feel free to use anything you find in this repo however you see fit. My current development environment utilizes mostly neovim (0.5+), zsh, and tmux, but this repo contains configurations for more than just those.

## Management
I manage my dotfiles as a bare git repository, as explained by this [article](https://www.atlassian.com/git/tutorials/dotfiles).
### Installation
- The following is a good idea to avoid any recursive issues when you clone this repo.
```
echo ".dotfiles" >$HOME/.gitignore
```
- Clone this in your home directory as a bare repository, which stores the git components in the `.dotfiles` directory rather than the usual `.git` directory.
```
git clone --bare git@github.com:danemortensen/dotfiles.git $HOME/.dotfiles
```
- Define the following alias for the current shell scope.
```
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```
- Checkout the content from the bare repository you just cloned to your home directory. If you get an error about overwriting working tree files at this point, it's because your home directory already contains files at the same path that this repository would like to add. To get around this, simply move these files to a backup directory somewhere, and checkout again.
```
config checkout
```
- Configure this local repository to not display untracked files as the majority of files in your home directory should not be added to this repo.
```
config config --local status.showUntrackedFiles no
```
### Updating
Now that you've successfully installed this is as a bare git repository, you can make updates using the following workflow:
```
echo "Hello, World!" >$HOME/example
config add $HOME/example
commit -m "Add test file"
config push
```
