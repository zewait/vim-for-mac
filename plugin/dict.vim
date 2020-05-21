function! ListDict(A, L, P)
    let output = system('ls ~/.vim/dict/')
    return join(map(split(output, "\n"), 'substitute(v:val, ".dict", "", "")'), "\n")
endfunction

