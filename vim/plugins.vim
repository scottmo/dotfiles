" vim: fdm=marker foldmarker={{{,}}} foldlevel=1

" Auto-install plugin manager {{{
    let s:plugInit=0
    if !filereadable(expand('~/.vim/autoload/plug.vim'))
        echo "Installing plugin manager.."
        echo ""
        silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let s:plugInit=1
    endif
" }}}
" List {{{
    " START {{{
        call plug#begin('~/.vim/bundle')
    " }}}
    " GUI {{{
        Plug 'mhinz/vim-startify'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        " # colorful parentheses
        Plug 'luochen1990/rainbow' " , { 'for': ['js', 'java', 'c', 'cpp'] }
        " # show function on the side
        " Plug 'majutsushi/tagbar', { 'for': ['c', 'cpp', 'java'] }
        " # show colors for css values
        Plug 'gorodinskiy/vim-coloresque'
        " Plug 'nathanaelkane/vim-indent-guides'
        Plug 'Yggdroot/indentLine'
        Plug 'airblade/vim-gitgutter'
        " # syntax highlighting for a lot of filetypes
        Plug 'sheerun/vim-polyglot'
        " # themes
        Plug 'iCyMind/NeoSolarized'
        Plug 'rakr/vim-one'
        Plug 'liuchengxu/space-vim-dark'
    " }}}
    " Utility {{{
        Plug 'christoomey/vim-system-copy'
        Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
        Plug 'tpope/vim-unimpaired'
        " git utilities wrapper
        Plug 'tpope/vim-fugitive'
        " show code result inline when run :Codi
        Plug 'metakirby5/codi.vim'
        Plug 'vim-syntastic/syntastic'
    " }}}
    " File Nav {{{
        " make vim's netwr file browser easy to use
        Plug 'tpope/vim-vinegar'
        " side bar file browser
        Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
    " }}}
    " AutoComplete/Edit {{{
        " convert between multiline code and one liner
        Plug 'AndrewRadev/splitjoin.vim'
        " make many commands repeatable with .
        Plug 'tpope/vim-repeat'
        " select textobject based on scope
        Plug 'gcmt/wildfire.vim'

        Plug 'tpope/vim-surround'
        Plug 'tomtom/tcomment_vim'

        Plug 'vim-scripts/SearchComplete'

        " auto insert (){}[]``````
        Plug 'jiangmiao/auto-pairs'
        " auto insert endif, done, etc
        Plug 'tpope/vim-endwise'
        " auto close html tags
        Plug 'alvan/vim-closetag'

        " if v:version >= 703 && has("lua")
        "     Plug 'Shougo/neocomplete.vim' " requires vim built with lua support
        "     Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
        " elseif has('nvim')
            " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            " let g:deoplete#enable_at_startup = 1
            " Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
        " else
            Plug 'ajh17/VimCompletesMe'
        " endif
    " }}}
    " Search & Replace/Movement {{{
        " util for search and replace in multiple files
        " Plug 'brooth/far.vim'
        " better abbreviation and substitution expression
        Plug 'tpope/vim-abolish'
        Plug 'terryma/vim-multiple-cursors'

        Plug 'MattesGroeger/vim-bookmarks'
        Plug 'Lokaltog/vim-easymotion'

        " async searcher
        " Plug 'mhinz/vim-grepper'

        " sublime-like fuzzy search in files
        " <leader>ff to search, during search:
        " - <c-o><c-r> toggle regex
        " - <c-o><c-s> toggle case-sensitivity
        " - <c-o><c-w> toggle whole word search
        " :%ESubstitute/from/to/gc to replace in search results
        Plug 'eugen0329/vim-esearch'

        if !has("gui_running")
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
        endif

        Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'
        Plug 'FelikZ/ctrlp-py-matcher'
    " }}}
    " Web Development {{{
        Plug 'mattn/emmet-vim'
        Plug 'maksimr/vim-jsbeautify'
        Plug 'ternjs/tern_for_vim', { 'dir': '~/.vim/bundle/tern_for_vim', 'do': 'npm install tern' }
    " }}}
    " END {{{
        call plug#end()
        if s:plugInit == 1
            :PlugInstall
        endif
    " }}}
" }}}
" Settings {{{
    " startify {{{
        let g:startify_session_dir='~/.vim/sessions/'
    " }}}
    " Airline {{{
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline_section_b='' " hunks, branch
        let g:airline_section_y='%{&ff}' " file format
        let g:airline_section_z='%c' " line/column
        let g:airline_section_c = '%t'

        let g:airline_left_sep=''
        let g:airline_right_sep=''
        let g:airline_left_alt_sep=''
        let g:airline_right_alt_sep=''
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''
        let g:airline#extensions#tabline#right_sep = ''
        let g:airline#extensions#tabline#right_alt_sep = ''
        let g:airline#extensions#whitespace#trailing_format = '\s\+$[%s]'
        let g:airline#extensions#whitespace#mixed_indent_format = '\t\s[%s]'
        let g:airline#extensions#whitespace#long_format = 'long[%s]'
        let g:airline#extensions#whitespace#mixed_indent_file_format = '\t[%s]'

        let g:airline_theme='base16'
    " }}}
    " rainbow {{{
        let g:rainbow_active = 0
        let g:rainbow_conf = {
            \   'guifgs' : ['royalblue3', 'darkorange3', 'seagreen3', '#ec8f6f'],
            \   'ctermfgs': ['141', '196', '112', '208', '129']
            \}
    " }}}
    " NerdTree {{{
        nmap <leader>n :NERDTreeTabsToggle<CR>
        nmap <leader>t :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=0
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '^\.class', '^\.o']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }}}
    " indent-guide {{{
        let g:indent_guides_enable_on_vim_startup = 0
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indentLine_char = '⎸'
        let g:indentLine_color_gui = '#414854'
    " }}}
    " GitGutter {{{
        " <leader>hs/r to stage/revert hunk,
        let g:gitgutter_realtime = 0
        let g:gitgutter_eager = 0
        nmap ]h <Plug>GitGutterNextHunk
        nmap [h <Plug>GitGutterPrevHunk
    " }}}
    " Easymotion {{{
        if v:version >= 703
            let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
            " bi-directional find motion
            nmap s <Plug>(easymotion-s2)
        endif
    " }}}
    " fzf {{{
        nnoremap <C-o> :FZF<cr>
    " }}}
    " CtrlP {{{
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_max_files = 0

        " use ag to search, use .agignore to exclude files
        " let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
        nnoremap <C-b> :CtrlPBuffer<cr>

        " CtrlP extensions --------------------
        " funky
        let g:ctrlp_extensions = ['funky']
        let g:ctrlp_funky_syntax_highlight = 1
        let g:ctrlp_funky_use_cache = 1
        nnoremap <C-f> :CtrlPFunky<cr>
        " matching
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    " }}}
    " Multicurosr {{{
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_next_key='<C-d>'
        " let g:multi_cursor_prev_key='<C-f>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
        let g:multi_cursor_exit_from_visual_mode=0
        " Compatibility setting for Shougo's Neocomplete {{{
        " Called once right before you start selecting multiple cursors
        function! Multiple_cursors_before()
            if exists(':NeoCompleteLock')==2
            exe 'NeoCompleteLock'
            endif
        endfunction
        " Called once only when the multiple selection is canceled (default <Esc>)
        function! Multiple_cursors_after()
            if exists(':NeoCompleteUnlock')==2
            exe 'NeoCompleteUnlock'
            endif
        endfunction
        " }}}
    " }}}
    " auto close tag {{{
        let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.cmp,*.app,*.xml,*.intf,*.evt"
    " }}}
    " snippet {{{
        " let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
        " imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        " smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        " xmap <C-k>     <Plug>(neosnippet_expand_target)

        " SuperTab like snippets behavior.
        " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
        " imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        " imap <expr><TAB>
        " \ pumvisible() ? "\<C-n>" :
        " \ neosnippet#expandable_or_jumpable() ?
        " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        "
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        " let g:UltiSnipsExpandTrigger="<tab>"
        " let g:UltiSnipsJumpForwardTrigger="<c-k>"
        " let g:UltiSnipsJumpBackwardTrigger="<c-j>"
    " }}}
    " Wildfire {{{
        nmap <leader>w <Plug>(wildfire-fuel)
        let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
        \ }

        cal wildfire#triggers#Add("<ENTER>", {
            \ "html,xml" : ["at", "it"],
        \ })
    " }}}
    " shougo neocomplete {{{
        " if v:version >= 703 && has("lua")
        "     " Disable AutoComplPop.
        "     let g:acp_enableAtStartup = 0
        "     let g:neocomplete#enable_at_startup = 1
        "     let g:neocomplete#enable_fuzzy_completion = 1
        "     let g:neocomplete_enable_fuzzy_completion_start_length = 2
        "     let g:neocomplete#enable_smart_case = 1
        "     " Set minimum syntax keyword length.
        "     let g:neocomplete#sources#syntax#min_keyword_length = 3
        "     let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        "     " key mapping
        "     inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        "     inoremap <expr><C-Space> pumvisible() ? "\<C-n>" : "\<TAB>"
        "     inoremap <expr><C-u> neocomplete#undo_completion()
        "     inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        "
        "     if !exists('g:neocomplete#same_filetypes')
        "         let g:neocomplete#same_filetypes = {}
        "     endif
        "     let g:neocomplete#same_filetypes.html  = 'css'
        "     let g:neocomplete#same_filetypes.xhtml = 'html'
        "     let g:neocomplete#same_filetypes.php = 'html'
        "     let g:neocomplete#same_filetypes.c = 'cpp'
        "     let g:neocomplete#same_filetypes.cpp = 'c'
        " endif
    " }}}
    " emmet {{{
        let g:user_emmet_leader_key='<C-e>'
        let g:user_emmet_install_global = 1
    " }}}
    " javascript {{{
        " allow html css syntax highlighting in javascript
        let javascript_enable_domhtmlcss = 1
        let g:jsx_ext_required = 1
    " }}}
    " ternjs {{{
        " close preview doc window when completion is done
        autocmd CompleteDone * pclose
    " }}}
    " syntastic {{{
        let g:syntastic_javascript_checkers = ['eslint']
        let b:syntastic_mode = 'passive'
    " }}}
    " markdown {{{
        let g:vim_markdown_folding_disabled = 1
    " }}}
    " jsbeautifyer {{{
        autocmd FileType javascript command! Beautify :call JsBeautify()<cr>
        autocmd FileType json command! Beautify :call JsonBeautify()<cr>
        autocmd FileType jsx command! Beautify :call JsxBeautify()<cr>
        autocmd FileType html command! Beautify :call HtmlBeautify()<cr>
        autocmd FileType css command! Beautify :call CSSBeautify()<cr>
    " }}}
    " themes {{{
        let g:neosolarized_vertSplitBgTrans = 0
        let g:neosolarized_bold = 1
        let g:neosolarized_underline = 1
        let g:neosolarized_italic = 1
        let g:neosolarized_contrast = "normal" " low, normal, high

        command! ThemeSolarized :colors NeoSolarized <bar> AirlineTheme solarized
        command! ThemeOne :colors one <bar> AirlineTheme one
    " }}}
" }}}
