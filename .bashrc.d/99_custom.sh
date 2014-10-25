[ -f '/opt/Sublime\ Text\ 2/sublime_text' ] && alias sl='/opt/Sublime\ Text\ 2/sublime_text'
command -v hub > /dev/null && alias git=hub

function server() {
	sensible-browser "http://localhost:${1}" && python -m SimpleHTTPServer $1
}
