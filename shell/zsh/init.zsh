#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

SHELL_FILES="$HOME/dotfiles/shell"

#
# theme
#
# needs to load this near the top for instant prompt
source $SHELL_FILES/zsh/powerlevel10k.zsh
# source $SHELL_FILES/zsh/theme.zsh

# init completions
autoload -Uz compinit
compinit
autoload bashcompinit
bashcompinit

#
# plugins
#

# plugin manager
source $SHELL_FILES/zsh/zinit.zsh
# source $SHELL_FILES/zsh/zim.zsh

# plugins settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

#
# my stuff
#

# History
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Input/output
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e
# Prompt for spelling correction of commands.
setopt CORRECT
# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

source $SHELL_FILES/base.sh
for file in $SHELL_FILES/plugins/*.sh; do
    source $file
done
