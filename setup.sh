#!/bin/sh

# oh my zsh
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "ohmyzsh exists! skipping...."
fi
ln -s -f ~/configs/.zshrc ~/.zshrc

# p10k
if [ ! -e ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "p10k exists! skipping...."
fi
ln -s -f ~/configs/.p10k.zsh ~/.p10k.zsh

# vim plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "vim plug exists! skipping...."
fi
# install vim plugins
ln -s -f ~/configs/.vimrc ~/.vimrc
vim -c "PlugInstall"

curl -sL install-node.now.sh/lts | bash
# symbol link everything
if [ -e ~/.vim/plugged/coc.nvim ]; then
  ln -s -f ~/configs/.vim/plugged/coc.nvim/autoload/coc.vim ~/.vim/plugged/coc.nvim/autoload/coc.vim
  ln -s -f ~/configs/.vim/coc-settings.json ~/.vim/coc-settings.json
fi

# coc plugins
if [! -e ~/.config ]; then
  mkdir ~/.config
fi
ln -s -f ~/configs/coc .config/coc

vim -c "CocInstall"

# setup tmux config
#cd
if [ ! -e "~/.tmux" ]; then
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  cp .tmux/.tmux.conf.local .
  echo "set -g default-terminal \"xterm-256color\"" >> ~/.tmux.conf
fi
