#!/usr/bin/env sh

! [ $(command -v git) ] && return 0

alias gcm="git commit --message"
alias gamend="git commit --amend --reuse-message HEAD"
alias gcpn="git cherry-pick --no-commit"
alias gcpx="git cherry-pick -x"
alias gcp="git cherry-pick"
alias gcr="git revert"
alias greverttobase="git reset HEAD^"
alias grevertlastcommit="git revert HEAD~"

alias gst="git status"
alias gss="git status -s"

alias ggls="git ls-files"

alias gms="git merge --squash"

# branch
alias gb="git branch | cat"
alias gbc="git checkout -b"
alias gbx="git branch -d"
alias gbX="git branch -D"
alias gbm="git branch -m"
alias gbM="git branch -M"
alias gco="git checkout"

alias thisb="git rev-parse --abbrev-ref HEAD"

alias gps="git push"
alias gp="git pull"

# util
alias gshrink="git repack -a -d -f --depth=250 --window=250"

# commit template
gfeat() { git commit -m "feat: $1" }
gfix() { git commit -m "fix: $1" }
gwip() { git commit -m "wip: $1" }
gchore() { git commit -m "chore: $1" }
gtest() { git commit -m "test: $1" }

