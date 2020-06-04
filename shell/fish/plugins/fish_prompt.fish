function __prompt_status
    set -l retval $status
    set -l symbols ""

    [ "$retval" -ne 0 ] && set -a symbols (set_color red; echo -n "(╯°□°）╯︵ ┻━┻ > $retval")
    [ (jobs -l | wc -l) -gt 0 ] && set -a symbols (set_color blue; echo -n "⚙")

    [ -n "$symbols" ] && echo "$symbols"
end
# function __theme_simple --description '- >>>'
#     set -l arrow (set_color blue; echo -n ">"; set_color yellow; echo -n ">"; set_color red; echo -n ">")
#     set -l dir (basename (dirname $PWD))/(basename $PWD)
#     set_color blue; echo -n "- $dir $arrow "
# end
function __theme_momo --description '<[ path ]> branch(dirty)\n$'
    set dir_color_bracket green -b normal
    set dir_color_path white -b green
    set dir (basename (dirname $PWD))/(basename $PWD)

    # <[ path ]> git_branch dirty
    set_color -o $dir_color_bracket; echo -n "<["
    set_color -o $dir_color_path; echo -n " $dir "
    set_color -o $dir_color_bracket; echo -n "]> "
    echo (git branch --no-color 2>/dev/null)

    set_color -o blue; echo -n "\$ "
end
function fish_prompt
    __prompt_status
    __theme_momo
    # __theme_simple
    set_color normal
end
