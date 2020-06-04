" vim: fdm=marker foldmarker={{{,}}} foldlevel=0

" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
else

call plug#begin('~/.vim/plugged')
" Custom {{{
    Plug '~/dotfiles/vim/custom_bundle'
" }}}
" UI {{{
    Plug 'mhinz/vim-startify'
        let g:startify_session_dir='~/.vim/sessions/'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#wordcount#enabled = 0

    if get(g:myplugins, 'indentline') == 1
    Plug 'Yggdroot/indentLine'
        let g:indentLine_enabled = 0
        let g:indentLine_faster = 1
        let g:indentLine_color_gui = '#414854'

        command! Indent2 :set ts=2 sts=2 sw=2 | IndentLinesReset
        command! Indent4 :set ts=4 sts=4 sw=4 | IndentLinesReset
    endif

    Plug 'airblade/vim-gitgutter'
        " <leader>hs/r to stage/revert hunk,
        let g:gitgutter_realtime = 0
        let g:gitgutter_eager = 0
        nmap ]h <Plug>GitGutterNextHunk
        nmap [h <Plug>GitGutterPrevHunk

    " themes
    Plug 'rakr/vim-one'
    Plug 'drewtempelmeyer/palenight.vim'
" }}}
" File Explorer {{{
    Plug 'tpope/vim-vinegar' " make vim's netwr file browser easy to use

    Plug 'scrooloose/nerdtree' " side bar file browser
    " Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
        nmap <leader>n :NERDTreeToggle<CR>
        nmap <leader>t :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=0
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '^\.class', '^\.o']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let NERDTreeAutoDeleteBuffer=1
        let NERDTreeDirArrows = 1
        let g:nerdtree_tabs_open_on_gui_startup=0
" }}}
" Utilities {{{
    Plug 'christoomey/vim-system-copy'

    Plug 'tpope/vim-unimpaired'

    Plug 'tmilloff/vim-address-bar'

    Plug 'pseewald/vim-anyfold'
        autocmd Filetype * AnyFoldActivate
        let g:anyfold_fold_comments=1

    Plug 'AndrewRadev/splitjoin.vim' " convert between multiline code and one liner

    Plug 'tpope/vim-repeat' " make many commands repeatable with .

    Plug 'gcmt/wildfire.vim' " select textobject based on scope
        nmap <leader>w <Plug>(wildfire-fuel)
        let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
        \ }

    Plug 'tpope/vim-surround'

    Plug 'tomtom/tcomment_vim'

    Plug 'vim-scripts/marvim' " macro persistent store

    """ Search & Replace/Movement
    Plug 'tpope/vim-abolish' " better abbreviation and substitution expression

    Plug 'terryma/vim-multiple-cursors'
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_next_key='<C-d>'
        " let g:multi_cursor_prev_key='<C-f>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
        let g:multi_cursor_exit_from_visual_mode=0

    Plug 'MattesGroeger/vim-bookmarks'

    Plug 'Lokaltog/vim-easymotion'
        let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
        " bi-directional find motion
        nmap s <Plug>(easymotion-s2)

    " sublime-like fuzzy search in files
    " <leader>ff to search, during search:
    " - <c-o><c-r> toggle regex
    " - <c-o><c-s> toggle case-sensitivity
    " - <c-o><c-w> toggle whole word search
    " :%ESubstitute/from/to/gc to replace in search results
    Plug 'eugen0329/vim-esearch'
        " let g:esearch = {
        "         \ 'adapter':    'rg',
        "         \ 'backend':    'nvim',
        "         \ 'out':        'win',
        "         \ 'batch_size': 1000,
        "         \ 'use':        ['visual', 'hlsearch', 'last', 'word_under_cursor'],
        "         \}
        " let g:esearch#adapter#rg#options = '--follow --iglob "!target/*"'
" }}}
" File finder {{{
    if get(g:myplugins, 'finder') == 'ctrlp'
        Plug 'kien/ctrlp.vim'
            " let g:ctrlp_use_caching = 0 " no need with fd
            " let g:ctrlp_user_command = 'fd --type f --follow --color=never "" %s'
            let g:ctrlp_follow_symlinks = 1
            let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|bzr|vim|vscode|eclipse|.cache)$'
            nnoremap <C-b> :CtrlPBuffer<CR>
        Plug 'tacahiroy/ctrlp-funky'
            let g:ctrlp_funky_syntax_highlight = 1
            nnoremap <C-r> :CtrlPFunky<CR>

    elseif get(g:myplugins, 'finder') == 'fzf'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
            nnoremap <C-p> :FZF<cr>
            nnoremap <C-b> :Buffers<cr>

            command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --follow --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                \   <bang>0)

    elseif get(g:myplugins, 'finder') == 'clap'
        Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
        nnoremap <C-p> :Clap files<cr>
        nnoremap <C-b> :Clap buffers<cr>
    endif
" }}}
" Autocomplete {{{
    Plug 'vim-scripts/SearchComplete'

    Plug 'jiangmiao/auto-pairs' " auto insert (){}[]``````
    " Plug 'rstacruz/vim-closer' " auto insert (){}[]``````
    " Plug 'cohama/lexima.vim'
        " let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.cmp,*.app,*.xml,*.intf,*.evt"

    Plug 'tpope/vim-endwise' " auto insert endif, done, etc
    Plug 'alvan/vim-closetag' " auto close html tags

    " tab autocomplete
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    if get(g:myplugins, 'autocomplete') == 'simple'
        Plug 'ajh17/VimCompletesMe'

    elseif get(g:myplugins, 'autocomplete') == 'lsp'

        Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
        Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
        Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

            inoremap <silent><expr> <c-space> coc#refresh()

            " gd - go to definition of word under cursor
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gy <Plug>(coc-type-definition)

            " gi - go to implementation
            nmap <silent> gi <Plug>(coc-implementation)

            " gr - find references
            nmap <silent> gr <Plug>(coc-references)

            " gh - get hint on whatever's under the cursor
            nnoremap <silent> K :call <SID>show_documentation()<CR>
            nnoremap <silent> gh :call <SID>show_documentation()<CR>

            function! s:show_documentation()
                if &filetype == 'vim'
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endfunction


            " Highlight symbol under cursor on CursorHold
            autocmd CursorHold * silent call CocActionAsync('highlight')

            nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
            nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

            " List errors
            nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

            " list commands available in tsserver (and others)
            nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

            " restart when tsserver gets wonky
            nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

            " view all errors
            nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

            " manage extensions
            nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

            " rename the current word in the cursor
            nmap <leader>cr  <Plug>(coc-rename)
            nmap <leader>cf  <Plug>(coc-format-selected)
            vmap <leader>cf  <Plug>(coc-format-selected)

            " run code actions
            vmap <leader>ca  <Plug>(coc-codeaction-selected)
            nmap <leader>ca  <Plug>(coc-codeaction-selected)
    endif
    " }}}
" }}}
" Markdown {{{
    Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
        let g:vim_markdown_folding_disabled = 1
" }}}
" IDE {{{
    Plug 'sheerun/vim-polyglot' " # syntax highlighting for a lot of filetypes

    if get(g:myplugins, 'lint') == 1
        Plug 'w0rp/ale' " async syntax check
    endif

    if get(g:myplugins, 'inlinecoderunner') == 1
        Plug 'metakirby5/codi.vim' " show code result inline when run :Codi
    endif

    if get(g:myplugins, 'web') == 1
        Plug 'othree/yajs.vim'
        Plug 'othree/es.next.syntax.vim'
            " allow html css syntax highlighting in javascript
            let javascript_enable_domhtmlcss = 1
            let g:jsx_ext_required = 1

        Plug 'mattn/emmet-vim'
            let g:user_emmet_leader_key='<C-e>'
            let g:user_emmet_install_global = 1

        Plug 'ap/vim-css-color' " # show colors for css values

        Plug 'maksimr/vim-jsbeautify'
            autocmd FileType javascript command! Beautify :call JsBeautify()<cr>
            autocmd FileType json command! Beautify :call JsonBeautify()<cr>
            autocmd FileType jsx command! Beautify :call JsxBeautify()<cr>
            autocmd FileType html command! Beautify :call HtmlBeautify()<cr>
            autocmd FileType css command! Beautify :call CSSBeautify()<cr>

        " Plug 'ternjs/tern_for_vim', { 'dir': '~/.vim/bundle/tern_for_vim', 'do': 'npm install tern' }
            " close preview doc window when completion is done
            " autocmd CompleteDone * pclose
    endif
" }}}
call plug#end()

endif
