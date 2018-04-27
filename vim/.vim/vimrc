set backspace=indent,eol,start " Allow backspace
set mouse=n " Allow scrolling
set hidden " Hide buffers instead of closing
set autoread " Auto reload if file changes outside of vim
set lazyredraw " Only redraw once macro is done running

" Fixes ESC delay
set timeoutlen=1000 
set ttimeoutlen=0 

" Search highlighting
set incsearch
set hlsearch

" Line numbers
set number
set relativenumber

" Tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set autoindent

" Don't backup
set nobackup
set noswapfile

" System clipboard
" if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

"   if has("unnamedplus") " X11 support
"     set clipboard+=unnamedplus
"   endif
" endif

" vim-plug ---------------------------------------
call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'SirVer/ultisnips'
  Plug 'alvan/vim-closetag'
  Plug 'ap/vim-buftabline'
  Plug 'haya14busa/is.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'xtal8/traces.vim'

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
  Plug 'styled-components/vim-styled-components'
  Plug 'w0rp/ale'

  " Themes
  Plug 'arcticicestudio/nord-vim'
call plug#end()
" ------------------------------------------------

" Syntax Highlighting
syntax on

if !has('gui_running')
  set t_Co=256
endif

" nord
let g:nord_uniform_diff_background = 1

colorscheme nord

" Create Rg command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Plugin config ----------------------------------
  " Closetag
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

  " UltiSnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

  " vim-javascript
  let g:javascript_conceal = 0
  
  " dirvish config
  let g:dirvish_mode = 2
  let g:dirvish_relative_paths = 1

  " Ale
  let g:ale_fixers = {}
  " let g:ale_fixers['javascript'] = ['eslint']
  let g:ale_fixers['javascript'] = ['prettier', 'eslint']
  let g:ale_fix_on_save = 1
" ------------------------------------------------

" Remappings -------------------------------------
  " <leader>
  let mapleader = ','

  nnoremap <leader>s :update<CR>
  nnoremap <leader>q :q<CR>

  " Get file path of current buffer
  nnoremap <leader>p :let @*=expand("%:p")<CR>
  
  " Open and source vimrc
  nnoremap <leader>v :e $MYVIMRC<CR>
  nnoremap <leader>r :so $MYVIMRC<CR>

  " Open zshrc
  nnoremap <leader>z :e ~/dotfiles/zsh/.zshrc<CR>

  " Open .tmux.conf
  nnoremap <leader>x :e ~/dotfiles/tmux/.tmux.conf<CR>

  " commentary mapping
  noremap <leader>c :Commentary<CR>

  " Disable ex mode
  nnoremap Q <Nop>

  " Buffer related mappings
  nnoremap <C-l> :bnext<CR>
  nnoremap <C-h> :bprevious<CR>
  nnoremap <leader>bq :bp <BAR> bd #<CR>

  " fzf mappings
  nnoremap <leader>t :Files<CR>
  nnoremap <leader>a :Rg<space>
  nnoremap <leader>f :Rg <C-r><C-w><CR>
  nnoremap <leader>gst :GFiles?<CR>

  nnoremap <leader>lg :call EasyConsoleLog()<CR>
" ------------------------------------------------

" Statusline -------------------------------------
  " Modified from https://github.com/ahmedelgabri/dotfiles/blob/c4f40c27b295ecfb7673bd29d373cab26b93379b/vim/vimrc.local#L302-L423

  " Get ale lint errors
  function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
  endfunction

  function! GitInfo()
    let git = fugitive#head()
    if git != ''
      return fugitive#head()
    else
      return ''
  endfunction

  set laststatus=2
  set statusline=
  set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
  set statusline+=%8*\ %<%F\ %m\ %w\                       " File+path
  set statusline+=%#warningmsg#
  set statusline+=%*
  set statusline+=%9*\ %=                                  " Space
  set statusline+=%{LinterStatus()}\                       " Lint errors
  set statusline+=%3p%%\ %l,%c\                            " total (%)/Row: Col
" ------------------------------------------------

" Billy's console log creator
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." --- ', ".word.")"
endfunction

filetype plugin indent on
