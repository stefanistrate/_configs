# Aliases. {{{
case "$OSTYPE" in
  darwin*)
    alias ls='ls -FG'
    ;;
  linux*)
    alias ls='ls -F --color=auto'
    ;;
esac
alias ll='ls -l'
alias la='ls -lA'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ps='ps -f'
# }}}

# Paths. {{{
PATH=/usr/bin:/bin:/usr/sbin:/sbin
PATH=/usr/local/bin:${PATH}  # Local binaries overwrite system binaries.
PATH=${PATH}:/opt/local/bin:/opt/local/sbin  # Optional binaries come last.
export PATH
# }}}

# History. {{{
export PROMPT_COMMAND="history -a"  # Save command history.
export HISTCONTROL=ignoreboth  # No duplicates or lines starting with space.
export HISTFILESIZE=1073741824
export HISTSIZE=1048576
shopt -s histappend  # Append to the history file, don't overwrite it.
bind '"\e[A":history-search-backward' 2>/dev/null  # Backward history search.
bind '"\e[B":history-search-forward' 2>/dev/null  # Forward history search.
# }}}

# Bash completion. {{{
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi
# }}}

# Visual. {{{
# Update the values of LINES and COLUMNS after the window size has changed.
shopt -s checkwinsize

# Powerline.
if [ -f ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh ]; then
  source ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh
fi
# }}}

# Local settings to overwrite general settings. {{{
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
# }}}
