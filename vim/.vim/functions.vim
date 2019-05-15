" Billy Montgomery's console log creator
function EasyConsoleLog(isVisual)
  if a:isVisual
    let word = @z
  else
    let word = expand("<cword>")
  endif 
  execute "normal! oconsole.log(\"".word." --- \", ".word.")"
endfunction

" Copy current buffer path to multiple buffers
function CopyPath() 
  execute "let @*=expand('%:p')"
  execute "let @+=expand('%:p')"
endfunction

" Copy current buffer path directory to multiple buffers
function CopyPathDir() 
  execute "let @*=expand('%:p:h')"
  execute "let @+=expand('%:p:h')"
endfunction

" Run ALEFix for eslint only
function FixEslint()
  let b:ale_fixers = {'javascript': ['eslint']}
  execute "ALEFix"
endfunction

function Format()
  let ft = &filetype
  if ft == 'cpp' || ft == 'c'
    silent execute "!clang-format -i " . bufname("%")
    execute "redraw!"
  elseif ft == 'javascript.jsx'
    let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
    execute "ALEFix"
  endif
endfunction

" Find and replace visual selection with argument
function ReplaceUnderVisual(replaceWord)
  let word = @z
  execute "%s/".word."/".a:replaceWord."/gc"
endfunction
