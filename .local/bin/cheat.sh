#!/bin/bash
set -e
# GitHub Streak Keeper / Helper
# - Because vim submodule updates count
(
  cd ~/.vim/bundle/ && (
    git checkout master \
      && git pull --rebase origin master \
      && git submodule update --init --recursive \
    && for dir in *; do (
         cd $dir;
         git pull --rebase origin master \
	   | grep -q -v 'is up to date' \
	   && git submodule update --init --recursive \
	   && [ "z$(basename $PWD)" = "zYouCompleteMe" ] \
	   && ./install.py --gocode-completer --clang-completer
         cd ..;
         git commit -m "updated .vim bundle $dir" $dir > /dev/null && git push
    ); done
  )
)
