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
# directory {{{
    # numFiles: Count of non-hidden files in current dir
    alias numFiles='echo (ls -1 | wc -l)'

    # qfind: Quickly search for file
    alias qfind="find . -name "

    function cmkdir
        mkdir -p $argv[1];cd $argv[1];
    end

    if test !(command -v tree)
        alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
    end
# }}}
# sys util {{{
    #   memHogsTop, memHogsPs:  Find memory hogs
    #   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

    #   cpuHogs:  Find CPU hogs
    #   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

    #   topForever:  Continual 'top' listing (every 10 seconds)
    #   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

    #   ttop:  Recommended 'top' invocation to minimize resources
    #   ------------------------------------------------------------
    #       Taken from this macosxhints article
    #       http://www.macosxhints.com/article.php?story=20060816123853639
    #   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"


    # determine local IP address
    alias ips='ifconfig | grep "inet " | awk "{ print $2 }"'
    # get external facing ip
    alias ip="curl icanhazip.com"

    function portpsat
        sudo lsof -i tcp:$argv[1]
    end

    function timeshell
        time $argv[1] -i -c echo
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
