# Commit
alias gcm='git commit --message'
alias gamend='git commit --amend --reuse-message HEAD'
alias gco='git checkout'
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

# diff
alias gdiff-unstaged='git diff'
alias gdiff-staged='git diff --cached'
alias gdiff-committed='git diff `thisb` origin/`thisb`'

# branch
alias gb='git branch | cat'
alias gbc='git checkout -b'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gco='git checkout'

thisb () {
    git rev-parse --abbrev-ref HEAD
}

gpush () {
    git push origin `thisb`
}

gpull () {
    git pull origin `thisb`
}

# util
alias gshrink='git gc --prune=now --aggressive'
