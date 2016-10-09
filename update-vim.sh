#!/bin/bash
#
# Iterate over the bundles in ~/.vim/bundles and update them.
#
echo "Updating the vim setup"
git pull
cp vimrc ~/.vimrc
cp muedark.vim ~/.vim/colors
echo "Done!"
#
# EOF
#
