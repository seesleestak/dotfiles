call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'SirVer/ultisnips'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'danro/rename.vim'

  " File management/navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-dirvish'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " JS
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'w0rp/ale'

  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-dotenv'
call plug#end()

" Plugin config ----------------------------------
  " Closetag
  let g:closetag_filenames = '*.html,*.js'

  " UltiSnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

  " vim-javascript
  let g:javascript_conceal = 0
  
  " dirvish config
  let g:dirvish_mode = 2
  let g:dirvish_relative_paths = 1
" ------------------------------------------------

" Open all folds when viewing fugitive commit files
autocmd BufEnter fugitive://* silent! %foldopen!

" autocmd BufReadPost *.dbout execute pclose | edit %:p
