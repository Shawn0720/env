#!/bin/bash

plugins=(
    "gmarik/vundle"
    "kien/ctrlp.vim"
    "Lokaltog/vim-powerline"
    "tpope/vim-sensible"
    "Raimondi/delimitMate"
    "tpope/vim-surround"
    "scrooloose/nerdtree"
    "SirVer/ultisnips"
    "ervandew/supertab"
)

for plugin in "${plugins[@]}"
do
    folder=`echo $plugin | awk -F "/" '{print $NF }'`
if [ -d "${HOME}/.vim/bundle/${folder}" ]; then
    echo "$plugin exist!!"
else
    git clone https://github.com/${plugin}.git ~/.vim/bundle/${folder}
fi
#   echo git clone https://github.com/${plugin}.git ~/.vim/bundle/${folder}
done

