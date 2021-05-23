#
# asdf
# https://github.com/asdf-vm/asdf
test -d ~/.asdf && source ~/.asdf/asdf.fish

#
# fnm
# https://github.com/Schniz/fnm
test -d ~/.fnm && fnm env | source

#
# rust
#
test -d ~/.cargo/bin && fish_add_path ~/.cargo/bin
