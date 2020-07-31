if [ ! -x /usr/bin/pbcopy ]; then
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi
