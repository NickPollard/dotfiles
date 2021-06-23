echo ">>> Backing up existing dotfiles..."
mkdir -p .backup_dotfiles
mv -v .vimrc .backup_dotfiles/.
mv -v .zshrc .backup_dotfiles/.
mv -v .vim .backup_dotfiles/.
mv -v nvim .backup_dotfiles/.
mv -v .gitconfig .backup_dotfiles/.
mv -v ~/.config/nvim/init.vim .backup_dotfiles/.

echo ">>> Symlink dotfiles from our repo..."
ln -fvs ~/.dotfiles/.vimrc ~/.vimrc
ln -fvs ~/.dotfiles/.zshrc ~/.zshrc
ln -fvs ~/.dotfiles/vim ~/.vim
#ln -fvs ~/.dotfiles/vim ~/nvim
ln -fvs ~/.dotfiles/.gitconfig .gitconfig
ln -fvs ~/.dotfiles/vim ~/.config/nvim

echo ">>> Create an empty .zshrc.local if one doesn't exist..."
touch ~/.zshrc.local

echo ">>> Install vimplug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
