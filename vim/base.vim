" vim: fdm=marker foldmarker={{{,}}} foldlevel=0

" Settings {{{
    " General {{{
        set nocompatible
        set ff=unix
        set autoread

        set viewoptions=folds,options,cursor,unix,slash " better window/*nix compatibility

        set backspace=indent,eol,start  " Backspace for dummies

        set ttyfast         " faster terminal updates

        set hidden              " Allow buffer switching without saving

        set sessionoptions-=help

        set modeline
        set modelines=5

        " paragraph wrapping
        " set formatoptions+=w
        " set tw=79

        set ttimeoutlen=50 " lower mode switching delay

        " Let Vim use utf-8 internally, because many scripts require this
        set encoding=utf-8
        set fileencodings=utf-8,gbk " add gbk to display Chinese gbk
    " }}}
    " nobackups {{{
        set nobackup
        set nowritebackup
        set noswapfile
    " }}}
    " indent {{{
        set autoindent      " indent automatically
        set shiftwidth=4    " << >> indent width
        set softtabstop=4   " backspace width = 4
        set tabstop=4       " tab width set to 4
        set expandtab       " expand tab into spaces
        " fixes html indenting in vim 7.4
        let g:html_indent_inctags = "html,body,head,tbody"
    " }}}
    " search {{{
        set incsearch       " do incremental searching
        set hlsearch        " highlight search terms
        set ignorecase      " ignore case
        set smartcase       " ignore case if search pattern is all lowercase,
                            "    case-sensitive otherwise
    " }}}
    " wildignore {{{
        set wildignore=*.o,*.pyc,*~,*.class
        set wildignore+=*.jpg,*.png,*.gif,*.pdf,*.tar,*.zip,*.tgz
        set wildignore+=*.tmp
        set wildignore+=.git,.atom,.idea,.settings,.travis
        set wildignore+=node_modules,bower_components,target,project_files,dist
        set wildignore+=.DS_Store
    " }}}
    " UI {{{
        set shortmess+=I    " disable startup text
        " set relativenumber  " use relativenumber for gutter"
        set mouse=a         " Automatically enable mouse usage
        set mousehide       " hide mouse when typing
        set laststatus=2    " always display status line
        set nu              " show number
        set linespace=3     " line spacing in pixel
        set tabpagemax=15   " Only show 15 tabs
        set showmode        " Display the current mode
        set showcmd         " display incomplete commands
        set ruler           " turn on status ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showmatch       " show matching parenthesis
        set virtualedit=onemore " Allow for cursor beyond last character

        set nowrap          " don't wrap text for performance reason

        set scrolljump=5    " Lines to scroll when cursor leaves screen
        set scrolloff=3     " Minimum lines to keep above and below cursor

        set splitbelow      " open split panes to bottom and
        set splitright      " right

        set wildmenu                    " Show list instead of just completing
        set wildmode=list:longest,full  " <Tab> completion, list matches, then longest common part, then all.

        set display+=lastline " no more @'s even when line doesn't fit screen

        set guitablabel=%t    " only display file name on tab title

        set foldnestmax=3

        let g:netrw_liststyle=3 " file tree layout

        set linebreak         " word wrapping
        set showbreak=\ \ "   " add 2 more spaces for indented wrapped lines

        if v:version >= 704
            set breakindent   " keep indent for wrapped lines
        endif
    " }}}
    " paste automatically with paste mode on {{{
        if exists('$TMUX')
            function! WrapForTmux(s)
                let tmux_start = "\<Esc>Ptmux;"
                let tmux_end = "\<Esc>\\"
                return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
            endfunction

            let &t_SI .= WrapForTmux("\<Esc>[?2004h")
            let &t_EI .= WrapForTmux("\<Esc>[?2004l")
        endif

        function! XTermPasteBegin()
            set pastetoggle=<Esc>[201~
            set paste
            return ""
        endfunction

        inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
    " }}}
    " Arrow Key Fix {{{
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }}}
" }}}
" Key Mapping {{{
    " New Bindings {{{
        let g:mapleader = ","
        
        imap jj <Esc>

        " Edit/Reload vimrc
        nmap <silent> <leader>ev :e ~/.vimrc<cr>
        nmap <silent> <leader>sv :so ~/.vimrc<cr>

        " highlight same words under cursor when double click on it
        nmap <2-LeftMouse> *

        " replace word under cursor
        nmap <leader>r :%s/\<<C-r><C-w>\>/
        " display all lines with keyword under cursor and ask which one to jump to
        nmap gr [I:let nr = input("Which one: ")<bar>exe "normal " . nr ."[\t"<cr>

        nmap <silent> <leader>/ :nohlsearch<cr>

        nnoremap th :tabprev<CR>
        nnoremap tl :tabnext<CR>
        nnoremap tn :tabnew<CR>

        noremap <leader>y "*y
        noremap <leader>p "*p

        set pastetoggle=<F12>
    " }}}
    " Command abbrev {{{
        " For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null
        " change to current working directory
        cmap cwd lcd %:p:h
        cmap pwdf echo @%
    " }}}
    " Default Replacements/Extension/Overwrite {{{

        " Yank from the cursor to the end of the line, to be consistent with C and D.
        nnoremap Y y$

        " save my pinky
        nnoremap fa zA
        nnoremap F za

        " fix stupid SHIFTs
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>

        nmap J j
        vmap J j
        nmap K k
        vmap K k
        nmap L l
        vmap L l
        nmap H h
        vmap H h

        " Swaps
        nnoremap k gk
        nnoremap j gj
        nnoremap gk k
        nnoremap gj j

        " Disabled
        nnoremap Q    q
        nnoremap q:   <NOP>
        " no help page
        nnoremap <F1> <NOP>
        inoremap <F1> <NOP>
    " }}}
" }}}
" Autocmd {{{
    augroup filetype_change " {{{
        au!
        au BufNewFile,BufRead *.markdown,*.md setlocal filetype=markdown
        au BufNewFile,BufRead *.html setlocal filetype=htmlm4 " show js syntax on html
    augroup end " }}}
" }}}
" Custom {{{
    " Toggle background color
    command! BG :let &background = (&background == "dark" ? "light" : "dark")

    " Indentation
    command! Indent2 :set ts=2 sts=2 sw=2
    command! Indent4 :set ts=4 sts=4 sw=4
    command! Indent2to4 :set ts=2 sts=2 sw=2 noet | retab! | set ts=4 sts=4 sw=4 et | retab
    command! Indent4to2 :set ts=4 sts=4 sw=4 noet | retab! | set ts=2 sts=2 sw=2 et | retab

    " Trailing Spaces
    command! Trim :%s:\s\+$::g

    " focus pane
    function! FocusModeToggle()
        " this doesn't work on large screen, but why if you get a big
        " enough screen to code
        if winheight(0) > 35 && winwidth(0) > 150
            :winc=
        else
            :999winc+ | 999winc>
        endif
    endfunction

    command! Focus call FocusModeToggle()
    nnoremap ƒ :call FocusModeToggle()<cr>

    " ruler
    set colorcolumn=0
    let s:color_column_old = 80
    function! s:ToggleColorColumn()
        if s:color_column_old == 0
            let s:color_column_old = &colorcolumn
            windo let &colorcolumn = 0
        else
            windo let &colorcolumn=s:color_column_old
            let s:color_column_old = 0
        endif
    endfunction

    command! Ruler call <SID>ToggleColorColumn()

    " wipebuffer
    function! DeleteInactiveBufs()
        "From tabpagebuflist() help, get a list of all buffers in all tabs
        let tablist = []
        for i in range(tabpagenr('$'))
            call extend(tablist, tabpagebuflist(i + 1))
        endfor

        let nWipeouts = 0
        for i in range(1, bufnr('$'))
            if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
                "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
                silent exec 'bwipeout' i
                let nWipeouts = nWipeouts + 1
            endif
        endfor
        echomsg nWipeouts . ' buffer(s) wiped out'
    endfunction
    command! WipeBuffer call DeleteInactiveBufs()
" }}}
