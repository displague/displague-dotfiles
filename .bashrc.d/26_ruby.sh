# disabled, overrides --user-install from ~/.gemrc
# export GEM_HOME="~/.gems"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
