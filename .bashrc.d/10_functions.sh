function sag(){
  sudo apt-get -qq -y $@;
}

function jj(){
	cat <<< "$(jq . < $1)" > $1;
}
