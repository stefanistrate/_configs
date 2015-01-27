#!/usr/bin/python
'''Installation script for OS X and Linux environments.'''

import os
import sys

def make_symlink(dest, dest_dir, src, src_dir):
    full_dest = '%s/%s' % (dest_dir, dest)
    full_src = '%s/%s' % (src_dir, src)
    print 'GOAL: %s -> %s' % (full_dest, full_src)

    if not os.path.isdir(dest_dir):
        print 'INVALID DESTINATION: %s' % dest_dir
        print 'SKIPPING...\n'
        return

    (leaf_dest_dir, _) = os.path.split(full_dest)
    if not os.path.isdir(leaf_dest_dir):
        os.makedirs(leaf_dest_dir)
    if os.path.exists(full_dest):
        print 'OOOPS! FILE EXISTS: %s' % full_dest
        while True:
            print 'Should I continue with this symlink? [y/n]'
            answer = raw_input().lower()
            if answer == 'n':
                break
            if answer == 'y':
                os.renames(full_dest, '%s.bak' % full_dest)
                print 'BACKUP: %s -> %s.bak' % (full_dest, full_dest)
                os.symlink(full_src, full_dest)
                print 'SUCCESS'
                break
    else:
        os.symlink(full_src, full_dest)
        print 'SUCCESS'
    print ''


if __name__ == '__main__':
    CWD = os.getcwd()
    HOME = os.environ['HOME']
    print 'Working directory: %s' % CWD
    print 'Home directory: %s' % HOME
    print ''

    # Adobe Photoshop.
    make_symlink('Presets/Scripts/WebSharpener_Settings.xml',
                 '/Applications/Adobe Photoshop CC 2014',
                 'adobe-photoshop/WebSharpener_Settings.xml', CWD)

    # Bash.
    make_symlink('.bashrc', HOME, 'bash/bashrc', CWD)
    make_symlink('.dircolors.ansi-dark', HOME, 'bash/dircolors.ansi-dark', CWD)
    make_symlink('.profile', HOME, 'bash/profile', CWD)

    # Git.
    make_symlink('.gitconfig', HOME, 'git/gitconfig', CWD)

    # GNOME Terminal.
    if sys.platform == 'linux2':
        make_symlink('.gnome-terminal-solarize.sh', HOME,
                     'gnome-terminal/solarize.sh', CWD)

    # Vim.
    make_symlink('.vimrc', HOME, 'vim/vimrc', CWD)
    make_symlink('.vim/after', HOME, 'vim/after', CWD)
