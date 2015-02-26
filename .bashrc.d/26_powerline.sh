for tmuxdir in \
$HOME/src/powerline/build/lib/powerline/bindings/tmux/ \
/usr/share/powerline/bindings/tmux/ \
; do
  [ -d "$tmuxdir" ] && export TMUX_POWERLINE_CONF="$tmuxdir";
done
