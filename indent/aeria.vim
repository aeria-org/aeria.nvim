if exists("b:did_indent")
  finish
endif

setlocal nolisp
setlocal autoindent
setlocal indentexpr=AeriaIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=),0=]

function! AeriaIndent(lnum) abort
  let prevlnum = prevnonblank(a:lnum-1)
  if prevlnum == 0
    return 0
  endif

  let prevl = substitute(getline(prevlnum), '//.*$', '', '')
  let currl = substitute(getline(a:lnum), '//.*$', '', '')
  let previ = indent(prevlnum)

  let ind = previ

  if prevl =~ '[({\[]\s*$'
    let ind += shiftwidth()
  endif

  if currl =~ '^\s*[)}\]]'
    let ind -= shiftwidth()
  endif

  return ind
endfunction

let b:did_indent = 1

