# enable color support of ls and also add handy aliases
if command -v dircolors > /dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -Ee '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if command -v colordiff > /dev/null; then
  alias diff=colordiff;
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias no='yes n'
alias plint='perl -Mstrict -Mdiagnostics -cw'

# sql style comments that persist in my history
alias -- '--'='#'

