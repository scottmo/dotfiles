# Log
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'

alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glgg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# Commit
alias gcm='git commit --message'
alias gamend='git commit --amend --reuse-message HEAD'
alias gco='git checkout'
alias gcpn='git cherry-pick --no-commit'
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

# stash
gsshow () {
    git stash show stash^{/$1} -p
}

gsapply () {
    git stash apply stash^{/$1}
}

alias gssave='git stash save'

# branch
alias gb='git branch'
alias gbc='git checkout -b'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gco='git checkout'

thisb () {
    git rev-parse --abbrev-ref HEAD
}

gpushbranch () {
    git push origin `thisb`
}

# util
alias gshrink='git gc --prune=now --aggressive'
