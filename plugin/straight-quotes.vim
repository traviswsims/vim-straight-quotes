if exists('loaded_straight_quotes_plugin') | finish | endif
let loaded_straight_quotes_plugin = 1

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /[“”‘’]/

function! s:FixQuotes(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/[“”]/"/g'
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[‘’]/'/g"
    call setpos('.', l:save_cursor)
endfunction

" Run :FixQuotes to substitute curly quotes for straight quotes.
command! -range=% FixQuotes call <SID>FixQuotes(<line1>,<line2>)
