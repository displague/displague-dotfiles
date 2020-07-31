# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  # First
  for path in /usr/local/Cellar/bash-completion/*/etc/bash_completion \
    /usr/share/bash-completion/bash_completion \
    /etc/bash_completion; do
    if [ -f $path ]; then
      . $path
      break
    fi
  done

  # All
  for path in /Applications/Xcode.app//Contents/Developer/usr/share/git-core/git-completion.bash \
    ; do
    if [ -f $path ]; then
      . $path
      break
    fi
  done
fi
