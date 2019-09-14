" Billy Montgomery's console log creator
function! EasyConsoleLog(isVisual) abort
  if a:isVisual
    let word = @z
  else
    let word = expand("<cword>")
  endif 
  execute "normal! oconsole.log(\"".word." --- \", ".word.")"
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

" Run ALEFix for eslint only
function! FixEslint() abort
  let b:ale_fixers = {'javascript': ['eslint']}
  execute "ALEFix"
endfunction

function! Format() abort
  let ft = &filetype
  if ft == 'cpp' || ft == 'c'
    silent execute "!clang-format -i " . bufname("%")
    execute "redraw!"
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
