call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'danro/rename.vim'
  Plug 'w0rp/ale'
  Plug 'SirVer/ultisnips'

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

  " Rust
  Plug 'rust-lang/rust.vim'

  " Colorschemes
  Plug 'seesleestak/nord-vim'
call plug#end()

" Plugin config ----------------------------------
  " Closetag
  let g:closetag_filenames = '*.html,*.js,*.jsx,*.svelte'

  " vim-javascript
  let g:javascript_conceal = 0

  " dirvish config
  let g:dirvish_mode = 2
  let g:dirvish_relative_paths = 1
" ------------------------------------------------
