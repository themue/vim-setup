#!/bin/bash
#
# Setup my vim environment.
#
echo "Setting up vim environment ..."
echo "Installing pathogen ..."
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/sessions
echo "Installing vimrc and colors ..."
cp vimrc ~/.vimrc
cp muedark.vim ~/.vim/colors
cd ~/.vim/autoload
curl -LSso pathogen.vim https://tpo.pe/pathogen.vim
echo "Fetching the bundles ..."
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/vim-erlang/vim-dialyzer.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/vim-erlang/vim-erlang-omnicomplete.git
git clone https://github.com/vim-erlang/vim-erlang-runtime.git
git clone https://github.com/vim-erlang/vim-erlang-skeletons.git
git clone https://github.com/vim-erlang/vim-erlang-tags.git
git clone https://github.com/TheMue/vim-gode.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/fishcakez/vim-rebar.git
git clone https://github.com/tpope/vim-scriptease.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-vinegar.git
git clone https://github.com/vimoutliner/vimoutliner.git
echo "Done!"
#
# EOF
#
