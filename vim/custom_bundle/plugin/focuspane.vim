" Author: Shaocong(Scott) Mo

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
