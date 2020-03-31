BASE='~/dotfiles/vim'

# vimrc
mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
cp $BASE/vimrc ~/.vimrc

# nvim
mkdir -p ~/.config/nvim/autoload
ln -sf $BASE/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/

vim +PlugInstall +qall
