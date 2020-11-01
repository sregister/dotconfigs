#!/usr/bin/env bash

#tmux
cp ./tmux.conf ~/.tmux.conf && echo "tmux configured"

#bash
cat ./bashrc >> ~/.bashrc && echo "bashrc configured"

#vim
cp -R vim ~/.vim && cp vimrc ~/.vimrc && echo "vim files configured"

echo 'source ~/.bashrc and :PlugInstall in vim"
