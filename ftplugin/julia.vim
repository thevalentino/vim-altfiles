function! GuessJuliaAltFileName()
    let full_fname = expand('%:p')
    if match(full_fname, '/src/') != -1 
        let full_fname = substitute(full_fname, '/src/', '/tests/', "")
        let full_fname = substitute(full_fname, '\.jl', '_tests.jl', "")
    elseif match(full_fname, '.\+\/tests\/.\+_tests.jl') != -1
        let full_fname = substitute(full_fname, '/tests/', '/src/', "")
        let full_fname = substitute(full_fname, '_tests.jl', '.jl', "")
    else
        echom "Not in a package; define b:alt_file by hand if needed"
        return 0
    endif

    let b:alt_file = full_fname
    return 1
endfunction


if !exists("b:alt_file")
    if GuessJuliaAltFileName()
        nnoremap <buffer> <silent> <Tab> :execute 'edit' b:alt_file<cr>
    endif
endif
