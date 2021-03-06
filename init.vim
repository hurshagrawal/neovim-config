" Neovim init.vim

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'icymind/NeoSolarized'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'ngg/vim-gn'
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'

"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'easymotion/vim-easymotion'
"Plug 'zxqfl/tabnine-vim'

Plug 'digitaltoad/vim-pug'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'

Plug 'fatih/vim-go', { 'for': ['go', 'golang'] }

Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'ianks/vim-tsx', { 'for': ['typescript', 'typescript.tsx'] }

Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

Plug 'elixir-editors/vim-elixir', { 'for': ['elixir'] }
Plug 'slashmili/alchemist.vim', { 'for': ['elixir'] }

" Chromium / cpp
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'chromium/vim-codesearch'

" Initialize plugin system
call plug#end()

" Solarized
colorscheme NeoSolarized
set background=dark
" let g:neosolarized_contrast = "low"
let g:neosolarized_visibility = "normal"
let g:neosolarized_italic = 0

" GUI Options
if has("gui_vimr")
  set termguicolors
  set title
endif

" Map the leader key to SPACE
let mapleader = "\<Space>"

set hidden

" ---Key mappings---
" Exit insert mode
imap jk <Esc>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj

map ; :
map <M-s> :w<CR>

nnoremap <silent> ∆ 10gj
nnoremap <silent> ˚ 10gk

" Turn off accidental lowercasing
vnoremap u y
vnoremap U y

" Change ex-mode keybinding
nnoremap <C-q> Q
nnoremap Q q

" Tabs
nnoremap  <Leader>t :tabnew<CR>
nnoremap  <Leader>h :tabprevious<CR>
nnoremap  <Leader>l :tabnext<CR>

" Copy to clipboard
vnoremap  <Leader>y  "+y
nnoremap  <Leader>Y  "+yg_
nnoremap  <Leader>y  "+y
nnoremap  <Leader>yy  "+yy

" Turn off accidental lowercasing
vnoremap u y
vnoremap U y

" Change ex-mode keybinding
nnoremap <C-q> Q
nnoremap Q q

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Other leader commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

"No arrow keys bro
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Get rid of annoying shift commands
map <S-down> <nop> 
map <S-up> <nop> 
imap <S-down> <nop> 
imap <S-up> <nop> 

nnoremap <silent> Y y$
nnoremap <silent> R v$hp
nnoremap <silent> <C-y> ggyy<C-o>

map <C-t> :NERDTreeToggle<CR>
map <C-e> :NERDTreeFind<CR>

map <C-a> :ALEDetail<CR>

" Ack
map <C-m> :cn<CR>
map <C-n> :cp<CR>

" Splits
"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> <C-w>h
" For h, we don't want to create a new split since it's usually NERDTree
" nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>
"leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

set winwidth=80
set winminwidth=20
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" ---General Settings---
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set smarttab

set noerrorbells        " No beeps.
set noshowmode          " No status line
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

"no backup and swap sucks
set nobackup
set noswapfile

" Set HTML indenting and zencoding
filetype indent on
set filetype=html
set autoindent
set smartindent

" Case insensitive searching
set ignorecase
set smartcase

 "Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Autocomplete on dashes
set iskeyword+=-

" Undo history between sessions
set undofile
set undodir=~/.config/nvim/undodir

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Color Column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"set colorcolumn=80
"hi ColorColumn guibg=#042028

" Default color scheme
syntax enable

" No middleclick paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Auto save buffers whenever you lose focus
au FocusLost * silent! wa

" Auto save buffers when you switch context
set autowriteall

" Remove search highlighting with esc
nnoremap <silent> <esc> :noh<CR><esc>

" Enable mouse support
set mouse=a

" Remember last buffer position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Supertab should tab properly
let g:SuperTabDefaultCompletionType = "<c-n>"

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help']
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#00333e' ctermbg=3

" Zencoding
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-e>'

" Ack should use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" FZF
let $FZF_DEFAULT_COMMAND .= 'ag --hidden --ignore .git -g ""'
map <silent> <c-p> :FZF<CR>

" - down / up / left / right
let g:fzf_layout = { 'down': '~25%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" NERDTree
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1

" NERDCommenter
let g:NERDSpaceDelims = 1

" Ale
let g:ale_completion_enabled = 1
let g:ale_sign_error = '»'
let g:ale_sign_warning = '›'

let g:ale_fixers = {
\   'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'elixir': ['mix_format'],
\   'cpp': ['clang-format'],
\}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_c_clangformat_executable = '/Users/hurshagrawal/workspace/chromium/src/buildtools/mac/clang-format'

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Alchemist
let g:alchemist_tag_disable = 1

" Liteline Ale Support
"
" This is regular lightline configuration, we just added
" 'linter_warnings', 'linter_errors' and 'linter_ok' to
" the active right panel. Feel free to move it anywhere.
" `component_expand' and `component_type' are required.
"
" For more info on how this works, see lightline documentation.
let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'gitbranch' ],
      \              [ 'filetype' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok'
      \ },
      \ }

autocmd User ALELint call lightline#update()

" ale + liteline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('› %d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('» %d', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

" Chromium + C++
so ~/workspace/chromium/src/tools/vim/filetypes.vim
