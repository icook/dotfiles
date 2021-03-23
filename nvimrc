" Initialize plug (https://github.com/junegunn/vim-plug)
call plug#begin('~/.nvil_silently = 1m/plugged')

" *****************************************************************************
" Plugins
" *****************************************************************************
"
" Language support
" ============================
Plug 'groenewege/vim-less'
Plug 'vim-ruby/vim-ruby'
Plug 'sheerun/vim-polyglot'   " Added for yaml, but has many
Plug 'boeckmann/vim-freepascal'
Plug 'cespare/vim-toml'

Plug 'Glench/Vim-Jinja2-Syntax'

" JSX (React)
" Disabled, maybe buggy as per https://stackoverflow.com/questions/3223695/javascript-indentation-in-vim#comment66976236_18670672
" Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
" TypeScript
Plug 'leafgarland/typescript-vim'

let g:jsx_ext_required = 0

" Javascript
Plug 'pangloss/vim-javascript'

" Terraform (.tf)
Plug 'hashivim/vim-terraform'

" Jsonnet (.jsonnet)
Plug 'google/vim-jsonnet'

" Infrequently used, but good to have on hand
" Plug 'google/vim-jsonnet'
" Plug 'tpope/vim-haml'
" Plug 'posva/vim-vue'
" Plug 'spacetekk/pgsql.vim'
" Plug 'tomlion/vim-solidity'

" Python
" Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/indentpython.vim'
Plug 'psf/black'

" HTML
" Hilight matching HTML tags
Plug 'Valloric/MatchTagAlways' 

" Rust
Plug 'rust-lang/rust.vim'
" Plug 'sebastianmarkow/deoplete-rust' " Autocomplete for Rust

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.24'}
let g:go_fmt_fail_silently = 1
let g:go_doc_popup_window = 1
" Plug 'zchee/deoplete-go'           " Superseded by coc.vim

" Color scheme
Plug 'w0ng/vim-hybrid'

" Navigation
" ============================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Other
" ============================
Plug 'majutsushi/tagbar'               " Shows functions/classes in easy menu
nmap <F8> :TagbarToggle<CR>
let g:tagbar_show_linenumbers = 2

Plug 'tpope/vim-commentary'            " Easy comment/uncommand
autocmd FileType sql setlocal commentstring=--\ %s
Plug 'rhysd/conflict-marker.vim'       " Hilighting for merge conflicts from git
Plug 'nathanaelkane/vim-indent-guides' " Color coding for indentation
Plug 'osyo-manga/vim-over'             " Shows matches for :s/ as typed
Plug 'bling/vim-airline'               " Pretty statusline
let g:airline_powerline_fonts = 1
set statusline^=%{coc#status()}

Plug 'lambdalisue/suda.vim'            " Easy sudo writing
Plug 'wellle/targets.vim'              " Better text objects
Plug 'tpope/vim-surround'              " For editing inside parens, tags, etc
Plug 'tpope/vim-repeat'                " Better repeat functionality for plugins
Plug 'tpope/vim-fugitive'              " Git integration. Blame, diff etc
Plug 'shumphrey/fugitive-gitlab.vim'   " Let fugitive.vim open gitlab projects
Plug 'tpope/vim-rhubarb'               " Let fugitive.vim open github projects
Plug 'jamessan/vim-gnupg'              " Editing gpg files seamless
" Some useful commands, mainly moving file easily
Plug 'tpope/vim-eunuch'
" Quickly switch casing styles...
Plug 'tpope/vim-abolish'

" Runs linters automatically. Shows indicator in gutters
Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_linters = {
\   'python': ['flake8', 'pylint', 'mypy'],
\}
let g:ale_python_flake8_options = '--ignore=E501'
let g:airline#extensions#ale#enabled = 1

Plug 'airblade/vim-gitgutter'          " Shows git modification artifacts in gutter

" Better clipboard perf. Changes d to 'delete', m to 'move' or cut
Plug 'svermeulen/vim-easyclip'
let g:EasyClipUseSubstituteDefaults = 1
nmap <c-w> <plug>EasyClipSwapPasteBackwards
nmap <c-e> <plug>EasyClipSwapPasteForward

" Completion
" ============================

" Disabled while trialing coc.nvim
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

call plug#end()

" *****************************************************************************
" Plugin Config
" *****************************************************************************

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jsonnet setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWinEnter *.jinja2 setfiletype jinja
autocmd FileType python syn keyword pythonDecorator True None False self
autocmd FileType python setlocal textwidth=0 
autocmd FileType html,jinja,css,scss,less,coffee,javascript,vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType gitcommit setlocal textwidth=0
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
let g:go_fmt_autosave = 1
nnoremap <C-p> :Files<CR>
nnoremap <C-y> :History<CR>
nnoremap <C-t> :Tags<CR>
nnoremap <C-q> :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --hidden --path-to-ignore ~/.ignore'
let g:loaded_sql_completion = 0
" Move it away from <C-c> which kills perf exiting insert mode
let g:ftplugin_sql_omni_key = '<C-j>'

" Lots and lots of general setup
""""""""""""""""""""""""""""""""""""""
colorscheme hybrid
filetype plugin indent on
syntax enable 
let mapleader = " "
let g:mapleader = " "

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set exrc                  " Load local .vimrc for specific projects
set listchars=tab:>-      " Make tab characters obvious
set wildmenu              " Make tab completion show options somewhat like zsh
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo
set wildignore+=.git\*,.hg\*,.svn\*,node_modules,processed 
set wildignorecase        " Ignore case in wildmode
set completeopt-=preview  " Disable the preview window on completeion
set hidden                "  hides buffers instead of closing them

set history=1000
set autoread             
set nofoldenable          " disable folding
set scrolloff=15          " Keep cursor near center of screen
set guicursor=
set mouse=nicr
set clipboard=unnamedplus " Copy to system clipboard by default
set ruler                 " Always show current position in bottom right of screen
set number                " And line numbers
set cmdheight=2
set updatetime=300
set shortmess+=c          " don't give |ins-completion-menu| messages.
set signcolumn=yes        " always show signcolumns
set autowrite
set backspace=eol,start,indent
set whichwrap+=<,>,h,l    " What motions jump to next line if we're at EOL
set laststatus=2          " always show a statusline
set ignorecase            " Ignore case when searching
set smartcase             " treat lower case as anycase, but uppercase as specific
set hlsearch              " Highlight search results
set incsearch             " search as you type
set lazyredraw            " Don't redraw while executing macros 
set showmatch             " Show matching brackets when text indicator is over them
set timeoutlen=500
set ttimeoutlen=0
set background=dark
set t_Co=256              " Enable full color terminal
set fileformats=unix,dos,mac " Use Unix as the standard file type

set showmatch             " Show matching bracket briefly
set matchtime=2           " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell

" Tab semantics
set expandtab             " Use spaces instead of tabs
set smarttab
set shiftwidth=4
set tabstop=4
set textwidth=0
set colorcolumn=80        " Show a line at 80 cols as a guide
set autoindent            " Auto indent
set wrap                  " Wrap lines

" Swapfiles aren't worth
set nobackup
set nowritebackup
set noswapfile

" Persist our undo history
set undodir=~/.vim/undodir
set undofile

" *****************************************************************************
" General remaps and leader
" *****************************************************************************

" Leader
" =================================================
" Make shortcut to easily edit file in same director
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>w :w<CR>
" Clear the hilight easily
nnoremap <leader><cr> :set hlsearch!<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gs :Gdiff<CR>
nnoremap <leader><space> :q<CR>

" F-Keys
" =================================================
map <F5> :so $MYVIMRC<CR>
map <F6> :e $MYVIMRC<CR>
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Normal mode
" =================================================
" Make Y behave like everything else...
nnoremap Y y$
" Make indentation easier
nnoremap > >>
nnoremap < <<
" Allow using tab and shift-tab for indentation toggle
"nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
" Remap VIM 0 to first non-blank character
nnoremap 0 ^
" Move a line of text up or down
nnoremap <C-n> mz:m+<cr>`z
nnoremap <C-m> mz:m-2<cr>`z
" move between windows with Ctrl+direction
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-l> :wincmd l<cr>
" Treat wrapped lines as multi lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
" Select the text that was just pasted
nnoremap gp `[v`]

" Insert Mode
" =================================================
" Fast Paste while in insert mode
inoremap <C-F> <C-G>u<C-R>"

" Visual mode 
" =================================================
" Visual mode pressing * or # searches for the current selection BROKEN!
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" Search and replace highlighted text
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>
" For moving a block of text a short distance. Matches normal mode single line
vnoremap <C-m> <esc>`<gv:m '<-2<cr>gv
vnoremap <C-n> <esc>`>gv:m '>+1<cr>gv
" Make indentation easier in visual mode
vnoremap < <gv
vnoremap > >gv

" *****************************************************************************
" Custom Functions
" *****************************************************************************

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  mark z
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite :call DeleteTrailingWS()
