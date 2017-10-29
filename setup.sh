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

confirmRun() {
    confirm "$1"
    if is_confirmed; then
        sh $DOTFILES_ROOT/$2
    fi
    e_line
}

backup_file () {
    local src=$1 dir=$2

    if [ -f "$src" -o -d "$src" -o -L "$src" ]; then
        mv "$src" "$dir/$(basename $src).bak"
        e_success "backed-up $src to $dir/$(basename $src).bak"
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

            backup_file $dst $BACKUP_DIR
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
    if [ -f $HOME/.bash_profile ]; then
        backup_file $HOME/.bash_profile
    fi
    echo "[[ -r ~/.bashrc ]] && . ~/.bashrc" >> ~/.bash_profile
}

setup_tpm() {
    confirm "Install tmux plugin manager?"
    if is_confirmed; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        e_success "Done! Remember to do prefix + I to install plugins"
    fi
    e_line
}

setup_git () {
    confirm "Set up git user account?"
    if is_confirmed; then
        ask ' - What is your github author name?'
        git config --global user.name $REPLY

        ask ' - What is your github author email?'
        git config --global user.email $REPLY

        e_success 'Done!'
    fi
    e_line
}

setup_zsh () {
    confirmRun "Setup zsh?" "shell/zsh/setup.sh"
}

setup_mac () {
    confirmRun "Setup brew?" "install/brew.sh"
}

install () {
    install_dotfiles
    setup_bashprofile
    setup_zsh
    setup_tpm
    setup_git

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
