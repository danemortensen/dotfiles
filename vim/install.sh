wd=$(pwd)

echo "linking $wd/vim to ~/.vim"
ln -s $wd/vim ~/.vim
echo "linking $wd/vimrc to ~/.vimrc"
ln -s $wd/vimrc ~/.vimrc

echo "downloading plug.vim to ~/.vim/autoload"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing plugins"
vim -c ":PlugInstall"

echo "vim installation complete"
