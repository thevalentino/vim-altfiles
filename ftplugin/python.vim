function! GuessPythonAltFileName()
    if !filereadable(expand('%:p:h') . '/__init__.py')
        echom "Not in a module; define b:alt_file by hand if needed"
        return 0
    endif
    let full_fname = expand('%:p')
    if match(full_fname, '_test\.py$') != -1
        let full_fname = substitute(full_fname, '/\(\w\+\)/tests/', '/\1/\1/', "")
        let full_fname = substitute(full_fname, '_test\.py$', '.py', "")
    else
        let full_fname = substitute(full_fname, '/\(\w\+\)/\1/', '/\1/tests/', "")
        let full_fname = substitute(full_fname, '\.py$', '_test.py', "")
    endif
    let b:alt_file = full_fname
    return 1
endfunction

if !exists("b:alt_file")
    if GuessPythonAltFileName()
        nnoremap <buffer> <silent> <Tab> :execute 'edit' b:alt_file<cr>
    endif
endif
