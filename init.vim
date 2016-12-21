" Neovim init.vim

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Raimondi/delimitMate'

" Initialize plugin system
call plug#end()

" Solarized
set termguicolors
colorscheme NeoSolarized
set background=dark
let g:neosolarized_contrast = "low"
let g:neosolarized_visibility = "normal"
let g:neosolarized_italic = 0
let g:airline_theme='solarized'

" GUI Options
if has("gui_vimr")
  set termguicolors
  set title
endif

" Map the leader key to SPACE
let mapleader = "\<Space>"

" ---Key mappings---
" Exit insert mode
imap jk <Esc>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj

map ; :
map <M-s> :w<CR>

" Turn off accidental lowercasing
vnoremap u y
vnoremap U y

" Change ex-mode keybinding
nnoremap <C-q> Q
nnoremap Q q

" Copy to clipboard
vnoremap  <Leader>y  "+y
nnoremap  <Leader>Y  "+yg_
nnoremap  <Leader>y  "+y
nnoremap  <Leader>yy  "+yy

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Other leader commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :CtrlP<CR>

"No arrow keys bro
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap <silent> Y y$
nnoremap <silent> R v$hp
nnoremap <silent> <C-y> ggyy<C-o>

map <C-t> :NERDTree<CR>

" Ack
map <C-a> :Ack
map <C-m> :cn<CR>
map <C-n> :cp<CR>

" Splits
map <C-\> :vsp<CR>
map <C-]> :sp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
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
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
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

" Save folds when you exit file, then reload when opening it again
au BufWinLeave *.* mkview
au BufWinEnter *.* loadview

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
set colorcolumn=80

" Default color scheme
syntax enable

" No middleclick paste
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>

" Auto save buffers whenever you lose focus
au FocusLost * silent! wa

" Auto save buffers when you switch context
set autowriteall

" Remove search highlighting with esc
nnoremap <silent> <esc> :noh<CR><esc>

" Remember last buffer position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help']
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#00333e' ctermbg=3

" Zencoding
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-e>'

" Turn on rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|dump|map|log|jpg|ico|png|gif)$'
let g:ctrlp_max_files = 0
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/source_maps/*,*/link_infos/*,*.log,*.dump,*/node_modules/*

" Run NeoMake on TS writes
au BufWritePost *.ts Neomake
let g:neomake_open_list = 2
let g:neomake_typescript_enabled_makers = ['tsc']

" NERDTree
let g:NERDTreeWinSize = 30

