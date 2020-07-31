command -v hub > /dev/null && alias git=hub

which packet > /dev/null && eval "$(packet completion bash)"

function server() {
	sensible-browser "http://localhost:${1}" && python -m SimpleHTTPServer $1
}
