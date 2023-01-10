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
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#wordcount#enabled = 0

    command! Indent2 :set ts=2 sts=2 sw=2 | IndentLinesReset
    command! Indent4 :set ts=4 sts=4 sw=4 | IndentLinesReset

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
" }}}
" Utilities {{{
    Plug 'christoomey/vim-system-copy'

    Plug 'tpope/vim-unimpaired'

    Plug 'tpope/vim-repeat' " make many commands repeatable with .

    Plug 'tpope/vim-surround'

    Plug 'tomtom/tcomment_vim'

    Plug 'terryma/vim-multiple-cursors'
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_next_key='<C-d>'
        " let g:multi_cursor_prev_key='<C-f>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
        let g:multi_cursor_exit_from_visual_mode=0
" }}}
" File finder {{{
    Plug 'kien/ctrlp.vim'
        let g:ctrlp_follow_symlinks = 1
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|bzr|vim|vscode|eclipse|.cache)$'
        nnoremap <C-b> :CtrlPBuffer<CR>
" }}}
" Autocomplete {{{
    Plug 'jiangmiao/auto-pairs' " auto insert (){}[]``````
    " Plug 'rstacruz/vim-closer' " auto insert (){}[]``````
    " Plug 'cohama/lexima.vim'
        " let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.cmp,*.app,*.xml,*.intf,*.evt"

    Plug 'tpope/vim-endwise' " auto insert endif, done, etc
    Plug 'alvan/vim-closetag' " auto close html tags

    " tab autocomplete
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    Plug 'ajh17/VimCompletesMe'

    " }}}
" }}}
call plug#end()

endif
