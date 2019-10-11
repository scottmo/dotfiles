#!/usr/bin/env bash

# enable fail-fast
set -e

# constants
DOTFILES_ROOT=$HOME/dotfiles
BACKUP_DIR=$DOTFILES_ROOT/backup
INSTALLED=$BACKUP_DIR/installed
LOCAL_DIR=$DOTFILES_ROOT/_local_

# imports
source $DOTFILES_ROOT/shell/lib.sh

run_if_allowed() {
    confirm "$1"
    if is_confirmed; then
        sh $DOTFILES_ROOT/$2
    fi
    e_line
}

backup_file_if_exists () {
    local src=$1 dest=$BACKUP_DIR
    if [ -f "$src" -o -d "$src" -o -L "$src" ]; then
        mv "$src" "$dest/$(basename $src).bak"
        e_success "backed-up $src to $dest/$(basename $src).bak"
    fi
}

install_dotfiles () {
    e_header 'Installing dotfiles\n'
    for dir in $DOTFILES_ROOT/*/; do
        for src in $(find "$dir" -type f \( -name "*.symlink" -or -name "*.template" \)); do
            dst="$HOME/.$(basename ${src%.*})"
            fileext=${src##*.}

            confirm "Install $dst?"
            [[ ! is_confirmed ]] && return

            backup_file_if_exists $dst
            echo $dst >> $INSTALLED

            if [ $fileext == 'symlink' ]; then
                ln -s "$src" "$dst"
                e_success "symlink $src to $dst"
            else # template
                cp "$src" "$dst"
                e_success "copy $src to $dst"
            fi
        done
    done
    e_success "All backed-up dotfiles have been moved to $BACKUP_DIR"
}

setup_bashprofile () {
    backup_file_if_exists $HOME/.bash_profile
    echo "[[ -r ~/.bashrc ]] && . ~/.bashrc" >> ~/.bash_profile
}

setup_tmux_pm() {
    confirm "Install tmux plugin manager?"
    if is_confirmed; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        e_success "Done! Remember to do prefix + I to install plugins"
    fi
    e_line
}

setup_mac () {
    run_if_allowed "Setup brew?" "install/brew.sh"
}

install () {
    install_dotfiles
    setup_bashprofile
    setup_zsh
    setup_tmux_pm

    if [ `uname` == "Darwin" ]; then
        setup_mac
    fi

    e_success "Done!"
}

uninstall () {
    e_info "Restoring old rc's..."
    for f in $BACKUP_DIR/.*.bak; do
        fname="${f##*/}"        # strip away dir path
        fname="${fname%.bak}" # strip away bak
        cp "$f" "$HOME/$fname"
        e_success "restored $fname"
    done
    e_info "Restore completed! "
    e_info "Check $INSTALLED to see what was installed previously"
    e_info "Please remove any extra file manually "
    e_info "(e.g. prezto, .dotfiles.bak, etc.)"
}

main() {
    # Link current folder to ~/dotfiles
    if [ "$DOTFILES_ROOT" != "$PWD" ]; then
        ln -s $PWD $DOTFILES_ROOT
    fi

    cd $DOTFILES_ROOT

    mkdir -p $BACKUP_DIR
    mkdir -p $LOCAL_DIR

    touch $INSTALLED

    echo "[i]nstall [u]ninstall"
    read -n 1 action
    case $action in
        'i') install ;;
        'u') uninstall ;;
          *) e_error "Option doesn't exists!" ;;
    esac
}
main
