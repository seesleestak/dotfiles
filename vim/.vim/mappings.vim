" <leader>
let mapleader = "\<Space>"

nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :checktime<CR>

" Copy file path of current buffer
nnoremap <leader>y :call CopyPath(0)<CR>

" Copy directory of current buffer
nnoremap <leader>d :call CopyPath(1)<CR>

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
nnoremap <leader>a   :Rg<CR>
nnoremap <leader>f   :Rg <C-R><C-W><CR>
nnoremap <leader>bf  :Buffers<CR>   
nnoremap <leader>gst :GFiles?<CR>   

" Format buffer with clang-format if cpp, prettier + eslint if js
nnoremap <leader>i :call Format()<CR>

" ALE
nnoremap <leader>w :ALENextWrap<CR>

" Show entire path on Ctrl+g
nnoremap <C-g> 1<C-g>

" Log function
nnoremap <leader>lg :call Log(0)<CR>
vnoremap <leader>lg "zy:call Log(1)<CR>

" Find and replace
nnoremap <leader>m :%s/<C-R><C-W>//gc<left><left><left>
vnoremap <leader>m "zy:call ReplaceUnderVisual("")<left><left>
