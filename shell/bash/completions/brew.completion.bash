if hash brew >/dev/null 2>&1; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi    

    if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
        . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    fi

    if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
        . $(brew --prefix)/share/bash-completion/bash_completion
    fi
fi
