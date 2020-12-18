#!/bin/bash

if [ "$#" -ne 1 ] || [[ "$1" != "light" && "$1" != "dark" ]] ; then
  echo "Usage: ./install.sh [light | dark]"
  exit 1
fi

set -e
set -x

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function make_symlink {
  src="$DOTFILES/$1"
  dest="$2"
  rm -rf "$dest.bak"
  if [[ -e "$dest" ]] ; then
    mv "$dest" "$dest.bak"
  fi
  mkdir -p "$( dirname "$dest" )"
  ln -s "$src" "$dest"
}

function install_atom {
  make_symlink Atom/config.cson ~/.atom/config.cson
  make_symlink Atom/github.cson ~/.atom/github.cson
  make_symlink Atom/init.coffee ~/.atom/init.coffee
  make_symlink Atom/keymap.cson ~/.atom/keymap.cson
  make_symlink Atom/kite-config.json ~/.atom/kite-config.json
  make_symlink Atom/snippets.cson ~/.atom/snippets.cson
  make_symlink Atom/styles.less ~/.atom/styles.less
}

function install_dircolors {
  make_symlink "dircolors/dircolors.ansi-$1" ~/.dircolors
}

function install_git {
  make_symlink git/gitconfig ~/.gitconfig
}

function install_gnome_terminal {
  case "$OSTYPE" in
    linux*)
      /bin/sh "$DOTFILES/GNOME Terminal/solarize.sh" "$1"
      ;;
  esac
}

function install_iterm2 {
  make_symlink iTerm2 ~/.iterm2
}

function install_tmux {
  make_symlink tmux/tmux.conf ~/.tmux.conf
}

function install_vim {
  make_symlink vim/vimrc ~/.vimrc
  make_symlink vim/after ~/.vim/after
}

function install_zsh {
  make_symlink zsh/zshrc ~/.zshrc
}

function install_vscode {
  make_symlink VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
}

install_atom
install_dircolors "$1"
install_git
read -p ">>> Install configs for GNOME Terminal? [y/N] " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]] ; then
  install_gnome_terminal "$1"
fi
install_iterm2
install_tmux
install_vim
install_vscode
install_zsh
