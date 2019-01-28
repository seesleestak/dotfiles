" <leader>
let mapleader = "\<Space>"

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>

" Copy file path of current buffer
nnoremap <leader>p :call CopyPath()<CR>

" Copy directory of current buffer
nnoremap <leader>d :call CopyPathDir()<CR>

" Open and source vimrc
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" Open zshrc
nnoremap <leader>z :e ~/.zshrc<CR>

" commentary mapping
noremap <leader>c :Commentary<CR>

" Buffer related mappings
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <leader>bq :bprevious <BAR> bd #<CR>

" fzf mappings
nnoremap <leader>t :Files<CR>
nnoremap <leader>a :Rg<space>
nnoremap <leader>f :Rg <C-r><C-w><CR>
nnoremap <leader>gst :GFiles?<CR>

" ALE
nnoremap <leader>w :ALENextWrap<CR>
nnoremap <C-p> :call FixPrettierEslint()<CR>
nnoremap <leader>e :call FixEslint()<CR>

" Show entire path on Ctrl+g
nnoremap <C-g> 1<C-g>

" JS console.log function
nnoremap <leader>lg :call EasyConsoleLog(0)<CR>
vnoremap <leader>lg "zy:call EasyConsoleLog(1)<CR>

" Find and replace
nnoremap <leader>m :call ReplaceUnderCursor("")<left><left>
vnoremap <leader>n "zy:call ReplaceUnderVisual("")<left><left>
