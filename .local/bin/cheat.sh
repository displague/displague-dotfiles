#!/bin/sh
# GitHub Streak Keeper / Helper
# - Because vim submodule updates count
(
  cd ~/.vim/bundle/ && (
    git submodule update --init --recursive;
    for dir in *; do (
      cd $dir;
      git pull --rebase origin master;
      cd ..;
      git commit -m "updated .vim bundle $dir" $dir > /dev/null && git push
    ); done
  )
)
