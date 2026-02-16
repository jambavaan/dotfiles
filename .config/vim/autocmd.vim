augroup highlight_yank
    autocmd!
    autocmd TextYankPost * call HighlightYank()
augroup END

function! HighlightYank()
    let l:start_line = line("'[")
    let l:end_line = line("']")
    let l:start_col = col("'[")
    let l:end_col = col("']")
    
    if l:start_line == l:end_line
        let l:pattern = '\%'.l:start_line.'l\%'.l:start_col.'c.*\%'.l:end_col.'c'
    else
        let l:pattern = '\%'.l:start_line.'l\%'.l:start_col.'c\_.*\%'.l:end_line.'l\%'.l:end_col.'c'
    endif
    
    let l:match_id = matchadd('IncSearch', l:pattern)
    call timer_start(200, {-> execute('call matchdelete(' . l:match_id . ')')})
endfunction
