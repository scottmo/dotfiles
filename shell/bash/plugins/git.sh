#!/usr/bin/env sh

! [ $(command -v git) ] && return 0



alias gcm='git commit --message'
alias gamend='git commit --amend --reuse-message HEAD'
alias gcpn='git cherry-pick --no-commit'
alias gcpx='git cherry-pick -x'
alias gcp='git cherry-pick'
alias gcr='git revert'
alias greverttobase='git reset HEAD^'
alias grevertlastcommit='git revert HEAD~'

alias gst='git status'

alias ggls='git ls-files'

alias gms='git merge --squash'

gsync () {
    branch="$1"
    if [ -z "$branch" ]; then
        branch="$(thisb)"
    fi
    git pull upstream "$branch" && git push origin "$branch"
}

# branch
alias gb='git branch | cat'
alias gbc='git checkout -b'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gco='git checkout'

alias thisb="git rev-parse --abbrev-ref HEAD"

gsetupstream() {
    git branch --set-upstream-to=origin/$1 $1
}

# util
alias gshrink='git gc --prune=now --aggressive'
