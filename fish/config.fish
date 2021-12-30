# vim: fdm=marker foldmarker={{{,}}} foldlevel=0

# plugins {{{
    if not functions -q fundle
        eval (curl -sfL https://git.io/fundle-install)
        echo "Please restart fish after installation."
    end

    fundle plugin 'jorgebucaran/replay.fish'
    fundle plugin 'oh-my-fish/plugin-brew'
    fundle plugin 'oh-my-fish/plugin-bang-bang'
    fundle plugin 'oh-my-fish/plugin-fasd'
    fundle plugin 'oh-my-fish/plugin-extract'
    fundle plugin 'oh-my-fish/plugin-osx'
    fundle plugin 'jorgebucaran/gitio.fish'
    fundle plugin 'oh-my-fish/theme-bobthefish'
    fundle init
# }}}
# prompt {{{
    # source ~/dotfiles/fish/prompt.fish
# }}}
# terminal title {{{
    function fish_title
        echo (prompt_pwd)
    end    
# }}}
# asdf {{{
    # https://github.com/asdf-vm/asdf
    test -d ~/.asdf && source ~/.asdf/asdf.fish
# }}}
# fnm {{{
    # https://github.com/Schniz/fnm
    test -d ~/.fnm && fnm env | source
# }}}
# rust {{{
    test -d ~/.cargo/bin && fish_add_path ~/.cargo/bin
# }}}
# source external files {{{
    # plugins from other shell
    if functions -q replay
        replay source ~/dotfiles/zsh/plugins/git.sh
        replay source ~/dotfiles/zsh/plugins/editor.sh
        replay source ~/dotfiles/zsh/plugins/tmux.sh
    end

    # local
    test -f ~/dotfiles/_local_/local.fish && source ~/dotfiles/_local_/local.fish
# }}}
