#!/usr/bin/python
'''Installation script for OS X and Linux environments.'''

import os
import subprocess
import sys

CWD = os.getcwd()
HOME = os.environ['HOME']
COLOR_NONE = '\033[0m'
COLOR_GREEN = '\033[0;32m'
COLOR_RED = '\033[0;31m'

def INFO(string):
    return '%s%s%s' % (COLOR_GREEN, string, COLOR_NONE)

def ERROR(string):
    return '%s%s%s' % (COLOR_RED, string, COLOR_NONE)

def make_symlink(src, dest_dir, dest):
    src_dir = CWD
    full_src = '%s/%s' % (src_dir, src)
    full_dest = '%s/%s' % (dest_dir, dest)
    print 'Source:\t\t%s' % INFO(full_src)
    print 'Destination:\t%s' % INFO(full_dest)

    if not os.path.isdir(dest_dir):
        print ('Skipping because base destination directory does not exist: %s'
               % ERROR(dest_dir))
        print ''
        return

    (leaf_dest_dir, _) = os.path.split(full_dest)
    if not os.path.isdir(leaf_dest_dir):
        os.makedirs(leaf_dest_dir)
    if os.path.exists(full_dest):
        print ERROR('Ooops! Destination exists!')
        while True:
            print ERROR('Should I overwrite it? [y/n]'),
            answer = raw_input().lower()
            if answer == 'n':
                break
            if answer == 'y':
                os.renames(full_dest, '%s.bak' % full_dest)
                print ('Existing destination file backed up at:\t%s'
                       % INFO('%s.bak' % full_dest))
                os.symlink(full_src, full_dest)
                print 'Done.'
                break
    else:
        os.symlink(full_src, full_dest)
        print 'Done.'
    print ''


if __name__ == '__main__':
    print 'Working directory: %s' % INFO(CWD)
    print 'Home directory: %s' % INFO(HOME)
    print ''

    # Adobe Photoshop.
    make_symlink('adobe-photoshop/WebSharpener_Settings.xml',
                 '/Applications/Adobe Photoshop CC 2014',
                 'Presets/Scripts/WebSharpener_Settings.xml')

    # Dircolors.
    make_symlink('dircolors/dircolors.ansi-dark', HOME, '.dircolors.ansi-dark')

    # Git.
    make_symlink('git/gitconfig', HOME, '.gitconfig')
    make_symlink('git/git-templates', HOME, '.git-templates')

    # GNOME Terminal.
    if sys.platform == 'linux2':
        subprocess.call("/bin/sh gnome-terminal/solarize.sh dark", shell=True)

    # Vim.
    make_symlink('vim/vimrc', HOME, '.vimrc')
    make_symlink('vim/after', HOME, '.vim/after')

    # Zsh.
    make_symlink('zsh/zshrc', HOME, '.zshrc')
