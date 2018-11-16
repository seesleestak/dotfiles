" Billy Montgomery's console log creator
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." --- ', ".word.")"
endfunction

function! CopyPath() " Copy current buffer path to multiple buffers
  execute "let @*=expand('%:p')"
  execute "let @+=expand('%:p')"
endfunction

function! CopyPathDir() " Copy current buffer path directory to multiple buffers
  execute "let @*=expand('%:p:h')"
  execute "let @+=expand('%:p:h')"
endfunction

function! FixEslint()
  let b:ale_fixers = {'javascript': ['eslint']}
  execute "ALEFix"
endfunction

function! FixPrettierEslint()
  let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
  execute "ALEFix"
endfunction
