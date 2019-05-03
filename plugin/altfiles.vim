function! SetAlternateFile(fname)
    let b:alt_file = a:fname
    nnoremap <buffer> <silent> <Tab> :execute 'edit' b:alt_file<cr>
endfunction


command! -nargs=* SetAlternateFile :call SetAlternateFile(<args>)

