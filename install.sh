#!/bin/sh

CHECKOUT=~/.local/share/dotfiles

for s in $CHECKOUT/.vim $CHECKOUT/.vimrc; do ln -s $s ~; done


mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim # https://tpo.pe/pathogen.vim
