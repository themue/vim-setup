#!/bin/bash
#
# Setup my vim environment.
#
echo "Setting up vim environment ..."
echo "Installing vim-plug ..."
mkdir -p ~/.vim/autoload ~/.vim/plugged ~/.vim/colors ~/.vim/sessions
echo "Installing vimrc and colors ..."
cp vimrc ~/.vimrc
cp muedark.vim ~/.vim/colors
cd ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Done!"
#
# EOF
#
