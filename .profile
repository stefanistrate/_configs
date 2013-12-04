# Copyright 2013 Stefan Istrate.

# Load .bashrc. {{{
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
# }}}

# Local settings. {{{
if [ -f ~/.profile.local ]; then
  source ~/.profile.local
fi
# }}}
