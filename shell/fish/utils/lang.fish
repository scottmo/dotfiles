#
# asdf
#
test -d ~/.asdf && source ~/.asdf/asdf.fish

#
# fnm
#
test -d ~/.fnm && fnm env | source

#
# rust
#
test -d ~/.cargo/bin && fish_add_path ~/.cargo/bin
