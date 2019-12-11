function! sj#haskell#SplitApplicative() abort
    let line = getline('.')
    if line =~ 'TODO'
        echoerr 'Not implemented'
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

function! sj#haskell#JoinApplicative() abort
    let line = getline('.')
    if line =~ 'TODO'
        echoerr 'Not implemented'
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

function! sj#haskell#SplitIf() abort
    let line = getline('.')
    if line =~ 'TODO'
        echoerr 'Not implemented'
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

function! sj#haskell#JoinIf() abort
    let line = getline('.')
    if line =~ 'TODO'
        echoerr 'Not implemented'
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction


function! sj#haskell#SplitList() abort
    let line = getline('.')
    if line =~ 'TODO'
        echoerr 'Not implemented'
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

function! sj#haskell#JoinList() abort
    let line = getline('.')
    if line =~ 'TODO'
        echoerr 'Not implemented'
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

function! s:LocateNonNestedArrow(line) abort
    " Find and return the column with the first => or ->, excluding any at the
    " beginning of the line
    " Find column of first non-whitespace character after first => or ->
    let i = match(line, '^\s*[=-]>\s*\zs\S')
    return -1
endfunction

function! sj#haskell#SplitTypeSignature() abort
    " TODO: insert a '() =>' if none exists
    let curline = line('.')
    let line = getline(curline)
    if line =~ '\(:\)\@<!::\(:\)\@!'
        " Spaces to indent by
        let spaces = matchstr(line, '^\s*') . repeat(' ', &sw)
        let col = s:LocateNonNestedArrow(line)
        while col > -1
            " Split off arrow, stripping leading whitespace
            execute curline . 's/\s*\%' . col . '/\r' . spaces . '/'
            " Go to the next line
            let curline += 1
            " Find the next arrow
            let col = s:LocateNonNestedArrow(getline(curline))
        endwhile
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

function! sj#haskell#JoinTypeSignature() abort
    let line = getline('.')
    if line =~ '\(:\)\@<!::\(:\)\@!'
        let spaces = matchstr(line, '^\s*')
        let after_sig = search('^' . spaces . '\S', 'n')
        execute ',' . (after_sig - 1) . 'j'
        " Remove any unnecessary instances of '() => ...'
        s/\s*(\s*)\s*=>\s*/ /g
        call histdel("search", -1)
        let @/ = histget("search", -1)
        return 1
    else
        return 0
        let line = getline('.')
    endif
endfunction

