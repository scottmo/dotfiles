#!/usr/bin/env sh

! [ $(command -v git) ] && return 0

# undo
alias gunstagefile="git reset -q HEAD --"
alias greverttobase="git reset HEAD^"
alias grevertlastcommit="git revert HEAD~"
alias grevertcommit="git reset --mixed HEAD~"
alias grevertunstaged="git checkout ."
alias grevertall="git reset --hard"
alias greverttohead="git reset --hard HEAD^"
alias grevertclean="!git reset --hard HEAD && git clean -d -f"
greverttoremote() {
    git reset --hard origin/$(gbthis)
}

# diff
alias gdiffstaged="git diff --cached"
alias gdiffparent="git diff HEAD^ HEA"
gdiffremote() {
    git diff $(gbthis) origin/$(gbthis)
}

# commit
alias gcm="git commit --message"
alias gamend="git commit --amend --reuse-message HEAD"
alias gcpn="git cherry-pick --no-commit"
alias gcpx="git cherry-pick -x"
alias gcp="git cherry-pick"
alias gms="git merge --squash"

alias gst="git status"
alias gss="git status -s"

gpushtrack() {
    git push -u origin `gbthis`
}
alias gpush="git push"
alias gpushf="git push --force"
alias gpull="git pull"
alias gpullf="git pull -X theirs"

gitsquashall() {
    git reset $(git commit-tree "HEAD^{tree}" "$@")
}

# branch
alias gb="git branch | cat"
alias gbnew="git checkout -b"
alias gbdelete="git branch -D"
alias gbrename="git branch -m"
alias gco="git checkout"
alias gbtrack="git branch --set-upstream-to"
alias gbuntrack="git rm -r --cached"
alias gbthis="git rev-parse --abbrev-ref HEAD"
gfetchremote() {
    git fetch origin $1:$1
}

alias gremotes="git remote -v"

alias ggls="git ls-files"

# history
alias ghistory="git log -10 --format=format:'%Cgreen%h %Creset%s (%aN, %ar)'"
alias ghistoryfile="git log --follow -p -w"
alias ghistorymerge="git log --ancestry-path --merges"
alias ghistorygraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# util
alias gshrink="git repack -a -d -f --depth=250 --window=250"
gsync() {
    git pull upstream $1 && git push origin $1
}
gcheckoutpr() {
    git fetch upstream pull/$1/head:$2 && git checkout $2
}

# commit template
gfeat() {
    git commit -m "feat: $1"
}
gfix() {
    git commit -m "fix: $1"
}
gwip() {
    git commit -m "wip: $1"
}
gchore() {
    git commit -m "chore: $1"
}
gtest() {
    git commit -m "test: $1"
}

