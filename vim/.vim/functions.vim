" Billy Montgomery's console log creator
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log(\"".word." --- \", ".word.")"
endfunction

" Copy current buffer path to multiple buffers
function! CopyPath() 
  execute "let @*=expand('%:p')"
  execute "let @+=expand('%:p')"
endfunction

" Copy current buffer path directory to multiple buffers
function! CopyPathDir() 
  execute "let @*=expand('%:p:h')"
  execute "let @+=expand('%:p:h')"
endfunction

" Run ALEFix for eslint only
function! FixEslint()
  let b:ale_fixers = {'javascript': ['eslint']}
  execute "ALEFix"
endfunction

" Run ALEFix for prettier and eslint
function! FixPrettierEslint()
  let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
  execute "ALEFix"
endfunction

function! ReplaceUnderCursor(replaceWord)
  let word = expand("<cword>")
  execute "%s/".word."/".a:replaceWord."/gc"
endfunction
