# vim:ft=zsh ts=2 sw=2 sts=2

CURRENT_BG='NONE'

# Special Powerline characters
() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  SEGMENT_SEPARATOR='>'
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}(╯°□°）╯︵ ┻━┻" # bad result
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && echo -n "$symbols\n"
}

prompt_bar() {
  local branch=$(thisb 2>/dev/null)
  local dir=$(basename $(dirname $PWD))/$(basename $PWD)
  echo -n "[ %{%F{yellow}%}$dir%{%f%b%k%} ] %{%F{cyan}%}$branch\n"
  prompt_segment blue white "¯\_(ツ)_/¯"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_bar
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
