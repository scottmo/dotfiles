" Author: Shaocong(Scott) Mo

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
