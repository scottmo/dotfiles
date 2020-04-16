#!/usr/bin/env fish

abbr -ag gcm 'git commit --message'
abbr -ag gamend 'git commit --amend --reuse-message HEAD'
abbr -ag gcpn 'git cherry-pick --no-commit'
abbr -ag gcpx 'git cherry-pick -x'
abbr -ag gcp 'git cherry-pick'
abbr -ag gcr 'git revert'
abbr -ag greverttobase 'git reset HEAD^'
abbr -ag grevertlastcommit 'git revert HEAD~'

abbr -ag gst 'git status'

abbr -ag ggls 'git ls-files'

abbr -ag gms 'git merge --squash'

function gsync
    set -l branch $argv[1]
    if test -z (branch)
        set -l branch (thisb)
    end
    git pull upstream (branch) && git push origin (branch)
end

# branch
abbr -ag gb 'git branch | cat'
abbr -ag gbc 'git checkout -b'
abbr -ag gbx 'git branch -d'
abbr -ag gbX 'git branch -D'
abbr -ag gbm 'git branch -m'
abbr -ag gbM 'git branch -M'
abbr -ag gco 'git checkout'

abbr -ag thisb "git rev-parse --abbrev-ref HEAD"

function gsetupstream
    git branch --set-upstream-to=origin/$argv[1] $argv[1]
end

# util
abbr -ag gshrink 'git gc --prune=now --aggressive'
