function fish_prompt
    #
    # prompt status
    #
    set -l retval $status
    set -l symbols ""

    [ "$retval" -ne 0 ] && set -a symbols (set_color red; echo -n "(╯°□°）╯︵ ┻━┻ > $retval")
    [ (jobs -l | wc -l) -gt 0 ] && set -a symbols (set_color blue; echo -n "⚙")

    [ -n "$symbols" ] && echo "$symbols"
    
    #
    # theme
    #
    set dir_color_bracket blue -b normal
    set dir_color_path white -b blue
    set dir (basename (dirname $PWD))/(basename $PWD)

    # <[ path ]> git_branch dirty
    set_color -o $dir_color_bracket; echo -n "<["
    set_color -o $dir_color_path; echo -n " $dir "
    set_color -o $dir_color_bracket; echo -n "]> "
    echo (git branch --no-color 2>/dev/null)

    set_color -o blue; echo -n "\$ "

    #
    # input
    #
    set_color normal
end