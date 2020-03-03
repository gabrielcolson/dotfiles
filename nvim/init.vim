"Plugins
"Managed via vim-plug
"Use :PlugInstall / :PlugClean
"Use :PlugUpdate / :PlugUpgrade
call plug#begin('~/.vim/plugged')
" Some colorscheme
Plug 'chriskempson/base16-vim'

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Automatic symbols completion
"File explorer
"Quick file rename
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'danro/rename.vim'

"FZF
Plug '/usr/local/opt/fzf' "Brew path
Plug 'junegunn/fzf.vim'

"Linting
Plug 'w0rp/ale'

"Languages support
Plug 'sheerun/vim-polyglot' "Just in case

call plug#end()

"Colors
set background=dark
set termguicolors
colorscheme base16-chalk

"Remap leader
let mapleader=" "

"Splits
"Split on right and on below
"More natural
"Use :s and :v
set splitright
set splitbelow
cabbrev s split
cabbrev v vsplit

"Search
"Search as you type
"Highlight results
"Ignore case
"Use qq to remove the highlight
set incsearch
set hlsearch
set ignorecase
nnoremap <silent> qq :nohl<CR>

"Avoid useless redraw
set lazyredraw

" Time waited for key press(es) to complete
" It makes for a faster key response
set ttimeout
set ttimeoutlen=50

"Remap escape
"jj is always near
inoremap jj <Esc>

"Remap page moves
"Avoid scrolling one line by one line
noremap <C-J> }
noremap <C-K> {

"Syntax processing
syntax on

"Buffers integration
"Buffers can be hidden but still alive
"Limit buffer history for speed
"Switch buffers by using ctrl+h/l
set hidden
set history=500
nnoremap <silent> <C-H> :bprev<CR>
nnoremap <silent> <C-L> :bnext<CR>

"Identation
"2 spaces indentations
filetype plugin indent on
syntax enable
set nosmartindent
set cindent
set shiftwidth=2
set list
set expandtab
set listchars=tab:..,trail:~

"Even for Rust
let g:rust_recommended_style=0

"But still insert tab
inoremap hh <C-V><Tab>

"Just in case I can not find
"these on the keyboard
inoremap ww <
inoremap WW >

"Remap write
nnoremap s :w<CR>

"Show matching chars
"Like () or {}
set showmatch

"More than 80 chars is bad
"Show a ruller on toggle
nnoremap <silent> cc :let &cc = &cc == '' ? '79' : ''<CR>

"Markdown syntax
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

"Signcolumns
"Avoid any unwanted background
set signcolumn=yes
hi clear SignColumn

"And set right Ale colors
high ALEErrorSign guibg=NONE guifg=red
high ALEWarningSign guibg=NONE guifg=yellow

"Status line
"Always show statusline
"Hide the mode indicator as it is built in Airline
"Hide command while typing
set laststatus=2
set noshowmode
set noshowcmd

"Ale signs
let g:ale_set_highlights=0
let g:ale_sign_error='→ '
let g:ale_sign_warning='→ '

"Linters to use
"If nothing is precised, the default linters are used
let g:ale_linters={
      \'javascript': ['eslint'],
      \'c': ['clang'],
      \'cpp': ['clang'],
      \'rust': ['rustc'],
      \}

"Ale C/C++ linting
"Use basic flags
"More specific flags should be provided on a project basis
"by using a local .nvimrc at projet root re-exporting these variables
let g:ale_c_clang_options='-Wall -Wextra -Wshadow --std=gnu11 -O0'
let g:ale_cpp_clang_options='-Wall -Wextra -Wshadow --std=gnu++17 -O0'

"Ale Python linting
"Override python.vim defaults
"Ignored rules are for 2 spaces indenting
let g:python_recommended_style=0
let g:ale_python_flake8_options='--ignore E111,E114,E121,E128'

"Airline
"Airline is the statusbar framework
"Set a matching colorscheme
"Do not use powerline
"Disable Git tracking
"Mode, Ale errors, filename
"Add 'warning' from Ale warning
"syntax, file position
let g:airline_theme='base16_grayscale'
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#default#layout=[
      \ [ 'a', 'error', 'c' ],
      \ [ 'x', 'z' ]
      \ ]
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=0
let g:airline_section_z=airline#section#create(['%l/%L'])
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#ale#error_symbol='✗ '
let g:airline#extensions#ale#warning_symbol='✝ '
let g:airline#extensions#ale#show_line_numbers=0
let g:airline#extensions#tagbar#enabled=0
let g:airline_symbols.readonly='ð'
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.branch=''

"FZF
"FZF is the fuzzy finder
"Define some shortcuts
"Choose a layout
"Get the good colors
"Hide the statusline when in FZF
noremap <silent> ff :FZF <CR>
let g:fzf_action={
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout={ 'down': '~30%' }
let g:fzf_colors =
      \ { 'fg':    ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal', 'Normal'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"And also the grepper
"Install ag because it is good
nnoremap <silent> <Leader>h :Ag<CR>

"And also the buffer switcher
noremap <silent> <Leader>j :Buffers <CR>

"Nerdtree
"TODO: Replace this with Vim's default shit
"Ignore object and Python stuff
nnoremap <silent> rr :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeIgnore=['\.o$', '\.pyc$', '__pycache__']

"Enable project specific stuff
"This is provided using a local .nvimrc
"Secure avoid loading dangerous stuff
set exrc
set secure

hi VertSplit guibg=None
