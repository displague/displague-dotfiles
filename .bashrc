# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Execute the .bashrc.d files
for f in $(ls ~/.bashrc.d/[0-9]*sh | sort -n); do
  . "$f";
done
