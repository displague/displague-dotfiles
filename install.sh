#!/bin/sh

CHECKOUT=~/.local/share/dotfiles

for s in $CHECKOUT/.vim $CHECKOUT/.vimrc; do
  ln -s $s ~;
done

# https://tpo.pe/pathogen.vim
url="https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim "$url"

~/.local/bin/cheat.sh
