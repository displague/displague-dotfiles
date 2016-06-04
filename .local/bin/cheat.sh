#!/bin/bash
set -x
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
           && ./install.py --gocode-completer --clang-completer --tern-completer
         cd ..;
         git commit -m "updated .vim bundle $dir" $dir > /dev/null && git push
    ); done
  )
)

# sudo apt-get install -y libboost-dev libboost-{python,filesystem,system,regex,thread}-dev g++ clang mono-xbuild cmake libmono-system-xml-linq4.0-cil libmono-system-data-datasetextensions4.0-cil libmono-microsoft-csharp4.0-cil golang
# #./install.py --system-libclang --system-boost --all
# ./install.py --system-libclang --system-boost --clang-completer --tern-completer --gocode-completer
