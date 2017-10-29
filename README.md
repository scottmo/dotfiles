## Dotfiles
A set of dotfiles I created/gathered. Since I mostly use Mac, these are geared toward Mac environment, but most should still work in any unix environment.

## Setup
The `setup.sh` script is not very robust, so try not to do anything funny. I haven't had the time to improve it, but it's usable.

### Install
```sh
$ git clone git@github.com:scottmo/dotfiles.git
$ cd ~/dotfiles
$ ./setup.sh
```
- then follow the prompt instructions

### Uninstall
```sh
$ ./setup.sh # then enter 0 to uninstall
```
- __Note__: *Currently the uninstall function doesn't work so well, you'll need to manually remove some of the files. However, all the configuration files are symlinked to $HOME, so you can just remove the symlinks. For .oh_my_zsh, just run uninstall_oh_my_zsh. For bash-it, just remove ~/.bash_it folder.*
