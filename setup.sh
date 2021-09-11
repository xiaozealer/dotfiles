#!/bin/sh

# symbol link everything
rm ~/.vimrc
rm ~/.zshrc
rm ~/.p10k.zsh
ln -s -F ~/configs/.vimrc ~/.vimrc
ln -s -F ~/configs/.p10k.zsh ~/.p10k.zsh
ln -s -F ~/configs/.zshrc ~/.zshrc

# download vimplug
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup tmux config
#cd
#git clone https://github.com/gpakosz/.tmux.git
#ln -s -f .tmux/.tmux.conf
#cp .tmux/.tmux.conf.local .
