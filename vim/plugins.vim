" vim: fdm=marker foldmarker={{{,}}} foldlevel=0

" Plugin List
" ------------------------------------------------------------
call plug#begin('~/.vim/bundle')
" GUI {{{
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
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
    Plug 'rakr/vim-one'
    Plug 'morhetz/gruvbox'
" }}}
" Utility {{{
    Plug 'christoomey/vim-system-copy'
    Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
    Plug 'tpope/vim-unimpaired'
    " git utilities wrapper
    Plug 'tpope/vim-fugitive'
    " show code result inline when run :Codi
    Plug 'metakirby5/codi.vim'
    Plug 'janko-m/vim-test'
    Plug 'Konfekt/FastFold'
    Plug 'Konfekt/FoldText'
" }}}
" File Nav {{{
    " make vim's netwr file browser easy to use
    Plug 'tpope/vim-vinegar'
    " side bar file browser
    Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
" }}}
" Edit {{{
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

    let s:useYCM = 1
    if s:useYCM == 1
        Plug 'Valloric/YouCompleteMe', {
            \ 'dir': '~/.vim/bundle/YouCompleteMe',
            \ 'do': './install.py --js-completer --go-completer'
            \ }
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    else
        if has('nvim')
            " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            " let g:deoplete#enable_at_startup = 1
            " Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
            Plug 'roxma/nvim-yarp'
            Plug 'ncm2/ncm2'
            Plug 'ncm2/ncm2-path'
            Plug 'ncm2/ncm2-bufword'
            Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
            Plug 'ncm2/ncm2-ultisnips'
            Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
        else
            Plug 'ajh17/VimCompletesMe'
        endif
    endif

    " async syntax check
    Plug 'w0rp/ale'
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

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'
    " Plug 'FelikZ/ctrlp-py-matcher'

    Plug 'Shougo/unite.vim'
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
" Airline {{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_section_b='' " hunks, branch
    let g:airline_section_y='%{&ff}' " file format
    let g:airline_section_z='%c' " line/column
    let g:airline_section_c='%t'

    let g:airline#extensions#whitespace#trailing_format = '\s\+$[%s]'
    let g:airline#extensions#whitespace#mixed_indent_format = '\t\s[%s]'
    let g:airline#extensions#whitespace#long_format = 'long[%s]'
    let g:airline#extensions#whitespace#mixed_indent_file_format = '\t[%s]'

    let g:airline_theme='one'
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
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
" }}}
" CtrlP {{{
    " let g:ctrlp_working_path_mode = 'ra'
    " let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
    " let g:ctrlp_clear_cache_on_exit = 0
    " let g:ctrlp_max_files = 0
    "
    " let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
    " let g:ctrlp_use_caching = 0
    " let g:ctrlp_match_window_reversed = 0
    "
    " nnoremap <C-b> :CtrlPBuffer<cr>
    "
    " " CtrlP extensions --------------------
    " " funky
    " let g:ctrlp_extensions = ['funky']
    " let g:ctrlp_funky_syntax_highlight = 1
    " let g:ctrlp_funky_use_cache = 1
    " nnoremap <C-f> :CtrlPFunky<cr>
    " " matching
    " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
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
    autocmd CompleteDone * pclose
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

    " use <TAB> to select the popup menu
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
endif
" }}}
" FastFold {{{
    nmap zuz <Plug>(FastFoldUpdate)
    let g:fastfold_savehook = 1
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

    let g:markdown_folding = 1
    let g:tex_fold_enabled = 1
    let g:vimsyn_folding = 'af'
    let g:xml_syntax_folding = 1
    let g:javaScript_fold = 1
    let g:sh_fold_enabled= 7
    let g:ruby_fold = 1
    let g:perl_fold = 1
    let g:perl_fold_blocks = 1
    let g:r_syntax_folding = 1
    let g:rust_fold = 1
    let g:php_folding = 1

    set foldlevel=10
" }}}
