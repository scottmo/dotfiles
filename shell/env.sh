#!/usr/bin/env sh

setenv dotfiles "$HOME/dotfiles"
setenv PATH "/usr/local/bin:/usr/local/sbin:$PATH"

# node
[ -d "$HOME/n" ] && setenv N_PREFIX "$HOME/n" && setenv PATH "$N_PREFIX/bin:$PATH"
# ruby
[ -d "$HOME/.rbenv/shims" ] && setenv PATH "$HOME/.rbenv/shims:$PATH"
# rust cargo
[ -d "$HOME/.cargo/bin" ] && setenv PATH "$HOME/.cargo/bin:$PATH"
