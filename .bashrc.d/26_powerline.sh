for powerlinedir in \
	$HOME/src/powerline/build/lib/powerline/bindings/ \
	/usr/share/powerline/bindings/ \
	; do
if [ -d "$powerlinedir" ]; then
	export TMUX_POWERLINE_CONF="$powerlinedir/tmux";
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	powerline-daemon -q
	. "$powerlinedir/bash/powerline.sh"
	break;
fi
done
