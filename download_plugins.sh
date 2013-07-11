#!/bin/bash

plugins=(
    "gmarik/vundle"
    "kien/ctrlp.vim"
    "Lokaltog/vim-powerline"
    "tpope/vim-sensible"
    "Raimondi/delimitMate"
    "tpope/vim-surround"
    "scrooloose/nerdtree"
)

for plugin in "${plugins[@]}"
do
    folder=`echo $plugin | awk -F "/" '{print $NF }'`
    git clone https://github.com/${plugin}.git ~/.vim/bundle/${folder}
#   echo git clone https://github.com/${plugin}.git ~/.vim/bundle/${folder}
done
