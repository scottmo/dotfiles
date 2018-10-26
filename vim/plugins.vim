" vim: fdm=marker foldmarker={{{,}}} foldlevel=0

" Plugin List
" ------------------------------------------------------------
call plug#begin('~/.vim/bundle')
" GUI {{{
    Plug 'mhinz/vim-startify'
    Plug 'itchyny/lightline.vim'
    Plug 'ap/vim-css-color' " # show colors for css values
    Plug 'Yggdroot/indentLine'
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot' " # syntax highlighting for a lot of filetypes
    " # themes
    Plug 'rakr/vim-one'
    Plug 'ErichDonGubler/vim-sublime-monokai'
    Plug 'phanviet/vim-monokai-pro'
" }}}
" Utility {{{
    Plug 'christoomey/vim-system-copy'
    Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-fugitive' " git utilities wrapper
    Plug 'metakirby5/codi.vim' " show code result inline when run :Codi
    Plug 'Konfekt/FastFold'
    Plug 'Konfekt/FoldText'
    Plug 'tmilloff/vim-address-bar'
    Plug 'nfvs/vim-perforce'
    " Plug 'ngemily/vim-vp4'
" }}}
" File Nav {{{
    Plug 'tpope/vim-vinegar' " make vim's netwr file browser easy to use
    Plug 'scrooloose/nerdtree' " side bar file browser
    " Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
" }}}
" Edit {{{
    Plug 'AndrewRadev/splitjoin.vim' " convert between multiline code and one liner
    Plug 'tpope/vim-repeat' " make many commands repeatable with .
    Plug 'gcmt/wildfire.vim' " select textobject based on scope
    Plug 'tpope/vim-surround'
    Plug 'tomtom/tcomment_vim'
    Plug 'vim-scripts/SearchComplete'

    " Plug 'jiangmiao/auto-pairs' " auto insert (){}[]``````
    Plug 'cohama/lexima.vim'
    " Plug 'rstacruz/vim-closer' " auto insert (){}[]``````
    Plug 'tpope/vim-endwise' " auto insert endif, done, etc
    Plug 'alvan/vim-closetag' " auto close html tags

    Plug 'vim-scripts/marvim'

    let s:useYCM = 0
    if s:useYCM == 1
        Plug 'Valloric/YouCompleteMe', {
            \ 'dir': '~/.vim/bundle/YouCompleteMe',
            \ 'do': './install.py --js-completer --go-completer'
            \ }
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    elseif has('nvim')
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " let g:deoplete#enable_at_startup = 1
        " Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'
        Plug 'ncm2/ncm2-path'
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
        Plug 'ncm2/ncm2-html-subscope'
        Plug 'ncm2/ncm2-ultisnips'
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    else
        Plug 'ajh17/VimCompletesMe' " this also works with tern
    endif

    " async syntax check
    " Plug 'w0rp/ale'
" }}}
" Search & Replace/Movement {{{
    " Plug 'brooth/far.vim' " util for search and replace in multiple files
    Plug 'tpope/vim-abolish' " better abbreviation and substitution expression
    Plug 'terryma/vim-multiple-cursors'

    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'Lokaltog/vim-easymotion'

    " Plug 'mhinz/vim-grepper' " async searcher

    " sublime-like fuzzy search in files
    " <leader>ff to search, during search:
    " - <c-o><c-r> toggle regex
    " - <c-o><c-s> toggle case-sensitivity
    " - <c-o><c-w> toggle whole word search
    " :%ESubstitute/from/to/gc to replace in search results
    Plug 'eugen0329/vim-esearch'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
" }}}
" Web Development {{{
    Plug 'othree/yajs.vim'
    Plug 'othree/es.next.syntax.vim'
    Plug 'mattn/emmet-vim'
    Plug 'maksimr/vim-jsbeautify'
    Plug 'ternjs/tern_for_vim', { 'dir': '~/.vim/bundle/tern_for_vim', 'do': 'npm install tern' }
" }}}
call plug#end()

" Settings
" ------------------------------------------------------------
" startify {{{
    let g:startify_session_dir='~/.vim/sessions/'
" }}}
" lightline {{{
    let g:lightline = {
    \   'colorscheme': 'one'
    \ }
    let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}
    let g:lightline.subseparator = {
    \   'left': '', 'right': '' 
    \}
" }}}
" NerdTree {{{
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
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }}}
" indent-line {{{
    let g:indentLine_enabled = 0
    let g:indentLine_faster = 1
    let g:indentLine_color_gui = '#414854'

    command! Indent2 :set ts=2 sts=2 sw=2 | IndentLinesReset
    command! Indent4 :set ts=4 sts=4 sw=4 | IndentLinesReset
" }}}
" GitGutter {{{
    " <leader>hs/r to stage/revert hunk,
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h <Plug>GitGutterPrevHunk
" }}}
" Easymotion {{{
    let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    " bi-directional find motion
    nmap s <Plug>(easymotion-s2)
" }}}
" fzf {{{
    nnoremap <C-p> :FZF<cr>
    nnoremap <C-f> :BLines<cr>
    nnoremap <C-b> :Buffers<cr>

    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --follow --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
" }}}
" Multicurosr {{{
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-d>'
    " let g:multi_cursor_prev_key='<C-f>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    let g:multi_cursor_exit_from_visual_mode=0
" }}}
" auto close tag {{{
    let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.cmp,*.app,*.xml,*.intf,*.evt"
" }}}
" Wildfire {{{
    nmap <leader>w <Plug>(wildfire-fuel)
    let g:wildfire_objects = {
        \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
    \ }

    cal wildfire#triggers#Add("<ENTER>", {
        \ "html,xml,htmlm4" : ["at", "it"],
    \ })
" }}}
" emmet {{{
    let g:user_emmet_leader_key='<C-e>'
    let g:user_emmet_install_global = 1
" }}}
" javascript {{{
    " allow html css syntax highlighting in javascript
    let javascript_enable_domhtmlcss = 1
    let g:jsx_ext_required = 1

    " ternjs - close preview doc window when completion is done
    " autocmd CompleteDone * pclose
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
" Autocomplete {{{
    if s:useYCM == 1
        command! -nargs=1 Rename :YcmCompleter RefactorRename <args>
        command! GoTo :YcmCompleter GoTo
        command! Format :YcmCompleter Format

        let g:UltiSnipsExpandTrigger="<c-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    elseif has('nvim')
        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " note that you must keep `noinsert` in completeopt, you must not use
        " `longest`. The others are optional. Read `:help completeopt` for
        " more info
        set completeopt=noinsert,menuone,noselect

        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

        let g:UltiSnipsExpandTrigger="<c-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    else
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    endif
" }}}
" FastFold {{{
    nmap zuz <Plug>(FastFoldUpdate)
    let g:fastfold_savehook = 1
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

    let g:markdown_folding = 0
    let g:vimsyn_folding = 'af'
    let g:xml_syntax_folding = 1
    let g:javaScript_fold = 1
    let g:sh_fold_enabled= 7
    let g:ruby_fold = 1

    set foldlevel=10
" }}}
" vim-esearch {{{
    let g:esearch = {
            \ 'adapter':    'rg',
            \ 'backend':    'nvim',
            \ 'out':        'win',
            \ 'batch_size': 1000,
            \ 'use':        ['visual', 'hlsearch', 'last', 'word_under_cursor'],
            \}
    let g:esearch#adapter#rg#options = '--follow --iglob "!target/*"'
" }}}
