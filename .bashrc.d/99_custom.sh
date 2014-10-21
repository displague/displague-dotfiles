alias chilhqdweb01='rdesktop -u mjohansson -d grcorp -g 1600x880 -D -xb -P -5 -z -a16 -E -r sound:local -r clipboard:PRIMARYCLIPBOARD -B chilhqdweb01.grcorp.guaranteedrate.ad &'
alias sl='/opt/Sublime\ Text\ 2/sublime_text'
which hub > /dev/null && alias git=hub

function server() {
	sensible-browser "http://localhost:${1}" && python -m SimpleHTTPServer $1
}
