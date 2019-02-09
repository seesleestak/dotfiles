call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'SirVer/ultisnips'
  Plug 'alvan/vim-closetag'
  Plug 'ap/vim-buftabline'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'

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

  " Color schemes
  " Plug 'chriskempson/base16-vim'
  " Plug 'drewtempelmeyer/palenight.vim'
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
