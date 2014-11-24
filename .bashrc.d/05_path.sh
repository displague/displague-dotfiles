try_paths=(
  "$HOME/perl5/bin"
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/bin"
  "$HOME/.gem/ruby/2.1.0/bin"
  "/opt/google/google_appengine"
  ${GOPATH//://bin:}/bin
);

for p in try_paths; do
  if [ -d "$p" ]; then
    PATH="$p${PATH+:}${PATH}";
  fi
done;

export PATH;


