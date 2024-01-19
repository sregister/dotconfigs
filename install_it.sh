#!/usr/bin/env bash

# TODO: replace all these with symlinks

#tmux
cp ./tmux.conf ~/.tmux.conf && echo "tmux configured"

#bash
cp ./bashrc ~/.bashrc && echo "bashrc configured"

#vim
#cp -R vim ~/.vim && cp vimrc ~/.vimrc && echo "vim files configured"
#echo "source ~/.bashrc and :PlugInstall in vim"

#neovim
#

mkdir -p ~/.local/bin/ || true
cp ./local/bin/* ~/.local/bin/ && echo "bin copied"

read -p "Install autoenv? (Y/yes to continue): " response

response=$(echo "$response" | awk '{print tolower($0)}')

if [[ "$response" == "y" || "$response" == "yes" ]]; then
    git clone 'https://github.com/hyperupcall/autoenv' ~/.autoenv
fi
