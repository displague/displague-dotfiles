#!/bin/sh
(
  cd ~/.vim/bundle/ && (
    git submodule update --init --recursive;
    for a in *; do (
      cd $a;
      git pull --rebase origin master;
      cd ..;
      git commit -m "updated .vim bundle $a" $a > /dev/null && git push
    ); done
  )
)