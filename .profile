###
### Author: Stefan Istrate
###

### Aliases.
alias ls='ls -FG'
alias ll='ls -l'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ps='ps -f'

### Paths.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

### History.
export HISTCONTROL=ignoreboth # No duplicates or lines starting with space.
export HISTFILESIZE=1073741824
export HISTSIZE=1048576
shopt -s histappend # Append to the history file, don't overwrite it.
bind '"\e[A":history-search-backward' 2>/dev/null # Backward history navigation.
bind '"\e[B":history-search-forward' 2>/dev/null # Forward history navigation.

### Visual.
# Update the values of LINES and COLUMNS after the window size has changed.
shopt -s checkwinsize

# Powerline.
if [ -f ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh ]; then
  source ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh
fi

### Google only.
if [ -f ~/.at_google ]; then
  source ~/.at_google
fi
