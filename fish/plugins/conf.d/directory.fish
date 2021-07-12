# numFiles: Count of non-hidden files in current dir
alias numFiles='echo (ls -1 | wc -l)'

# qfind: Quickly search for file
alias qfind="find . -name "

function cmkdir
    mkdir -p $argv[1];cd $argv[1];
end

if test !(command -v tree)
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
end
