call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'danro/rename.vim'

  " Snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'

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
  Plug 'burner/vim-svelte'
call plug#end()

" Plugin config ----------------------------------
  " Closetag
  let g:closetag_filenames = '*.html,*.js,*.svelte'

  " vim-javascript
  let g:javascript_conceal = 0
  
  " dirvish config
  let g:dirvish_mode = 2
  let g:dirvish_relative_paths = 1
" ------------------------------------------------
