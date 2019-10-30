" Billy Montgomery's log creator
function! Log(isVisual) abort
  if a:isVisual
    let word = @z
  else
    let word = expand("<cword>")
  endif 

  if &filetype == 'rust'
    execute "normal! oprintln!(\"".word." --- {}\", ".word.");"
  elseif &filetype == 'sh'
    execute "normal! oecho \"".word." --- $".word."\""
  else
    execute "normal! oconsole.log(\"".word." --- \", ".word.")"
  endif
endfunction

" Copy current buffer path to multiple buffers
function! CopyPath(dirPath) abort
  if a:dirPath
    execute "let @*=expand('%:p:h')"
    execute "let @+=expand('%:p:h')"
  else
    execute "let @*=expand('%:p')"
    execute "let @+=expand('%:p')"
  endif
endfunction

function! Format() abort
  let ft = &filetype
  if ft == 'cpp' || ft == 'c'
    silent execute "!clang-format -i " . bufname("%")
    execute "redraw!"
  elseif ft == 'rust'
    execute "RustFmt"
  elseif ft == 'javascript.jsx'
    let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
    execute "ALEFix"
  elseif ft == 'scss'
    let b:ale_fixers = {'scss': ['stylelint']}
    execute "ALEFix"
  endif
endfunction

" Find and replace visual selection with argument
function! ReplaceUnderVisual(replaceWord) abort
  let word = @z
  execute "%s/".word."/".a:replaceWord."/gc"
endfunction
