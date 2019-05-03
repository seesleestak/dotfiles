" <leader>
let mapleader = "\<Space>"

nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>

" Copy file path of current buffer
nnoremap <leader>p :call CopyPath()<CR>

" Copy directory of current buffer
nnoremap <leader>d :call CopyPathDir()<CR>

" Open and source vimrc
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" commentary mapping
noremap <leader>c :Commentary<CR>

" Buffer related mappings
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bb :b #<CR>

" fzf mappings
nnoremap <leader>t   :Files<CR>     
nnoremap <leader>a   :Rg<space>     
nnoremap <leader>f   :Rg<C-R><C-W><CR>
nnoremap <leader>bf  :Buffers<CR>   
nnoremap <leader>gst :GFiles?<CR>   
nnoremap <leader>bc  :BCommits<CR>  

" Fugitive mappings
nnoremap <leader>gd :Gdiff<CR>

" ALE
nnoremap <leader>w :ALENextWrap<CR>
nnoremap <C-p>     :call FixPrettierEslint()<CR>

" Show entire path on Ctrl+g
nnoremap <C-g> 1<C-g>

" JS console.log function
nnoremap <leader>lg :call EasyConsoleLog(0)<CR>
vnoremap <leader>lg "zy:call EasyConsoleLog(1)<CR>

" Find and replace
nnoremap <leader>m :%s/<C-R><C-W>//gc<left><left><left>
vnoremap <leader>m "zy:call ReplaceUnderVisual("")<left><left>
