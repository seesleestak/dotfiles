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
function! CopyPath() abort
  execute "let @*=expand('%:p')"
  execute "let @+=expand('%:p')"
endfunction

" Copy current buffer path directory to multiple buffers
function! CopyPathDir() abort
  execute "let @*=expand('%:p:h')"
  execute "let @+=expand('%:p:h')"
endfunction

function! Format() abort
  let ft = &filetype
  if ft == 'cpp' || ft == 'c'
    silent execute "!clang-format -i " . bufname("%")
    execute "redraw!"
  elseif ft == 'svelte'
    let b:ale_linter_aliases = {'svelte': ['css', 'javascript']}
    let b:ale_linters = {'svelte': ['eslint']}
    let b:ale_fixers = {'svelte': ['prettier', 'eslint']}
    execute "ALEFix"
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
