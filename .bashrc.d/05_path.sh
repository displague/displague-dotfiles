try_paths=(
  "$HOME/perl5/bin"
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/bin"
  "/opt/google/google_appengine"
);

for p in try_paths; do
  if [ -d "$p" ]; then
    PATH="$p${PATH+:}${PATH}";
  fi
done;

export PATH;


