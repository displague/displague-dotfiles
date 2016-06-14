try_paths=(
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/bin"
  "$HOME/perl5/bin"
  "$HOME/Library/Python/2.7/bin"
  "$HOME/Library/Python/3.4/bin"
  "$HOME/Library/Python/3.5/bin"
  "$HOME/.gem/ruby/2.0.0/bin"
  "$HOME/.gem/ruby/2.1.0/bin"
  "$HOME/.gems/bin"
  "$HOME/.local/share/npm/bin"
  "$HOME/.local/share/google-cloud-sdk/bin"
  "/opt/google/google_appengine"
  ${GOPATH//://bin:}/bin
  {/usr{/local,},}/sbin
);

for p in "${try_paths[@]}"; do
  if [ -d "$p" ]; then
    PATH="$p${PATH+:}${PATH}";
  fi
done;

export PATH;


