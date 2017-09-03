try_paths=(
  {/usr{,/local},}/{,s}bin
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/bin"
  "$HOME/perl5/bin"
  "$HOME/Library/Python/2.7/bin"
  $HOME/Library/Python/3.{4..8}/bin
  $HOME/.gem/ruby/2.{0..4}.0/bin
  "$HOME/.gems/bin"
  "$HOME/.local/share/npm/bin"
  "$HOME/.local/share/google-cloud-sdk/bin"
  "/opt/google/google_appengine"
  ${GOPATH//://bin:}/bin
);

unset PATH
for p in "${try_paths[@]}"; do
  if [ -d "$p" ]; then
    PATH="$p${PATH+:}${PATH}";
  fi
done;

export PATH;


