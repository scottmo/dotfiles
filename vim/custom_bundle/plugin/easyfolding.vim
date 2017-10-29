" Author: Shaocong(Scott) Mo
" File: autofold.vim

" fold text {{{
    function! NiceFoldText()
        "get first non-blank line
        let fs = v:foldstart
        while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
        endwhile
        if fs > v:foldend
            let line = getline(v:foldstart)
        else
            let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
        endif

        let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
        let foldSize = 1 + v:foldend - v:foldstart
        let foldSizeStr = " " . foldSize . " lines "
        let foldLevelStr = repeat("+--", v:foldlevel)
        let lineCount = line("$")
        let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
        let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
        return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
    endfunction
    set foldtext=NiceFoldText()
" }}}

" autofolding {{{
    command! F1 :set foldlevel=1
    command! F2 :set foldlevel=2
    command! F3 :set foldlevel=3
    command! F0 :set foldlevel=99 " unfold all

    command! Mbbb :set fdm=marker | set foldmarker={{{,}}} | F0
    command! Mb   :set fdm=marker | set foldmarker={,}     | F0

    function! AutoSetFold()
        if &ft =~ 'javascript\|java\|c\|cpp\|css'
            set foldmethod=marker
            set foldmarker={,}
            F0
        elseif &ft =~ 'ruby\|python\|xml\|html'
            set foldmethod=indent
            F0
        endif
    endfunction

    augroup autofold_filetype
        au!
        au BufNewFile,BufRead * call AutoSetFold()
    augroup end
" }}}

" keep folding {{{
    " when editing folds, vim will expand all the other folds
    " this change folding to manual while editing the folds to keep the 
    " folding
    augroup keep_fold
        au!
        au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
        au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    augroup end
" }}}


" vim: foldmethod=marker foldmarker={{{,}}} foldlevel=0

