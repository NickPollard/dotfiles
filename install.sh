mkdir -p .backup_dotfiles
mv .vimrc .backup_dotfiles/.
mv .zshrc .backup_dotfiles/.
mv .vim .backup_dotfiles/.
mv .gitconfig .backup_dotfiles/.
ln -fvs ~/dotfiles/.vimrc .vimrc
ln -fvs ~/dotfiles/.zshrc .zshrc
ln -fvs ~/dotfiles/vim .vim
ln -fvs ~/dotfiles/.gitconfig .gitconfig
