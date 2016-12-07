#!/bin/bash

set -e
set -x

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function make_symlink {
  src="$DOTFILES/$1"
  dest="$2"
  rm -rf "$dest.bak"
  if [[ -e "$dest" ]]; then
    mv "$dest" "$dest.bak"
  fi
  mkdir -p "$( dirname "$dest" )"
  ln -s "$src" "$dest"
}

function install_dircolors {
  make_symlink dircolors/dircolors.ansi-dark ~/.dircolors.ansi-dark
  make_symlink dircolors/dircolors.ansi-light ~/.dircolors.ansi-light
}

function install_git {
  make_symlink git/gitconfig ~/.gitconfig
}

function install_gnome_terminal {
  case "$OSTYPE" in
    linux*)
      /bin/sh "$DOTFILES/gnome-terminal/solarize.sh" light
      ;;
  esac
}

function install_iterm2 {
  make_symlink iterm2 ~/.iterm2
}

function install_pylint {
  make_symlink pylint/pylintrc ~/.pylintrc
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


install_dircolors
install_git
install_gnome_terminal
install_iterm2
install_pylint
install_tmux
install_vim
install_zsh
