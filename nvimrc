filetype off                   " required!

set runtimepath+=/Users/icook/.vim/bundle/neobundle.vim/
call plug#begin('~/.nvim/plugged')

" Navigation and the like
"""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Language support
""""""""""""""""""
Plug 'tpope/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'jnwhiteh/vim-golang'
Plug 'groenewege/vim-less'
Plug 'vim-ruby/vim-ruby'
Plug 'icook/Vim-Jinja2-Syntax'
Plug 'tpope/vim-haml'
Plug 'saltstack/salt-vim'
Plug 'chase/vim-ansible-yaml'
" Matched HTML tags
Plug 'Valloric/MatchTagAlways' 
" Proper indentation, etc on python
Plug 'klen/python-mode'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Color schemes
"""""""""""""""
Plug 'vim-scripts/peaksea'
Plug 'flazz/vim-colorschemes'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'

" Other
"""""""""""""""
" Better Completion
Plug 'Valloric/YouCompleteMe'
" Allows easy switching between .h and .cpp
Plug 'derekwyatt/vim-fswitch'
" Cool statusline
Plug 'bling/vim-airline'
" Causes <C-X>/<C-A> to affect dates
Plug 'tpope/vim-speeddating'
" Snippets
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
" For editing parens, etc
Plug 'tpope/vim-surround'
" Better repeat functionality for plugins
Plug 'tpope/vim-repeat'
" Git plugin
Plug 'tpope/vim-fugitive'
" Modify the change semantic slightly, very useful
Plug 'briandoll/change-inside-surroundings.vim'
" Some useful commands, mainly moving file easily
Plug 'tpope/vim-eunuch'
" Quickly switch casing styles...
Plug 'tpope/vim-abolish'
" Syntax helper
Plug 'benekastah/neomake'
Plug 'mileszs/ack.vim'
" Easily swap splits
Plug 'wesQ3/vim-windowswap'
Plug 'airblade/vim-gitgutter'
" Better clipboard perf
Plug 'svermeulen/vim-easyclip'
" Generate tags files without any headache
Plug 'ludovicchabant/vim-gutentags'
" Autocomplete for Rust
Plug 'racer-rust/vim-racer'
" Let fugitive.vim open gitlab projects
Plug 'shumphrey/fugitive-gitlab.vim'

call plug#end()

" Enable filetype plugins
filetype plugin indent on
syntax on
"filetype plugin on

" Lots and lots of general setup
""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000
" Set to auto read when a file is changed from the outside
set autoread
" disable folding"
set nofoldenable    
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","
" Keep if fairly centered
set scrolloff=15
set mouse=nicr
" Make tab completion show options somewhat like zsh
set wildmenu
set wildmode=list:longest,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.pyo
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*,node_modules,processed 
endif
" Ignore case in wildmode
set wildignorecase
"Always show current position
set ruler
" And line numbers
set number
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid
set autowrite
set autoread
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers (as you type)
set incsearch 
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 80 characters
set textwidth=0
set colorcolumn=80
set ai "Auto indent
set wrap "Wrap lines
" Noswappin
set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files

" Colorschemes
""""""""""""""""""""""""""""""""""""
" Setup some fonts for windows and the like
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif

" Enable syntax highlighting
syntax enable 
set background=dark
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif
set t_Co=256
colorscheme hybrid
" Use Unix as the standard file type
set ffs=unix,dos,mac


" Opening/Saving file triggers and functionality change
""""""""""""""""""""""""""""""""""""
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
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Turn persistent undo on means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" Mode Switches
""""""""""""""""""""""""""""""""""""""""""""""""""
" absolute line numbers in insert mode, relative otherwise for easy movement
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set rnu

""""""""""""""""""""""""""""""""""""""""""""""""""
" General remaps and leader
""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader Mappings
""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nnoremap <leader>w :w!<cr>
" Make shortcut to easily edit file in same director
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
" Close the current buffer
nnoremap <leader>bd :Bclose<cr>
" Close all buffers easily
nnoremap <leader>ba :bufdo bdelete<cr>
nnoremap <leader>c :call IntSurround()<cr>
" Clear the hilight easily
nnoremap <leader><cr> :set hlsearch!<CR>

" F-Keys
""""""""""""""""""""""""""""""""""""""""""
map <F5> :so $MYVIMRC<CR>
map <F6> :e $MYVIMRC<CR>

" Normal mode
"""""""""""""""""""""""""""""""""""""""""
" Make Y behave like everything else...
nnoremap Y y$
" ` works for marks, so ' is more useful for selecting registers
nnoremap ' " 
" Make indentation easier
nnoremap > >>
nnoremap < <<
" This won't work because ctrl+i behaviour
" nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
" Remap VIM 0 to first non-blank character
nnoremap 0 ^
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <C-n> mz:m+<cr>`z
nnoremap <C-m> mz:m-2<cr>`z
" Smart way to move between windows
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-l> :wincmd l<cr>
nnoremap <C-p> :FZF<CR>
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
" Select the text that was just pasted
nnoremap gp `[v`]
" When moving to a paragraph, actually move to top
nnoremap } }j
nnoremap { {k

" Insert Mode
"""""""""""""""""""""""""""""""""""""""""""""
" Fast Paste while in insert mode
inoremap <C-F> <C-G>u<C-R>"

" Visual mode 
""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
vnoremap <silent> <leader><cr> :noh<cr>
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" Search and replace highlighted text
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>
" For moving a block of text a short distance. Matches normal mode single line
vnoremap <C-m> <esc>`<gv:m '<-2<cr>gv
vnoremap <C-n> <esc>`>gv:m '>+1<cr>gv
" Make indentation better
vnoremap < <gv
vnoremap > >gv

" fswitch. Swap between .h/.cpp with f4
nmap <silent> <F4> :FSHere<cr>

" snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

" Airline
let g:airline_powerline_fonts = 1

set statusline+=%{gutentags#statusline('[Generating...]')}
" Pythonmode
let g:pymode_trim_whitespaces = 0
let g:pymode_quickfix_maxheight = 0
let g:pymode_lint = 0
let g:pymode_rope_completion = 0

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd! BufWritePost * Neomake
let g:neomake_python_pylama_maker = {
    \ 'args': ['--format', 'pep8', '--ignore', 'E501'],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }

" EasyClip
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyClipUseSubstituteDefaults = 1
nmap <c-w> <plug>EasyClipSwapPasteBackwards
nmap <c-e> <plug>EasyClipSwapPasteForward

"" Filetype specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWinEnter *.jinja2 setfiletype jinja

" HTML
autocmd FileType html,jinja,css,scss,less,coffee,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType gitcommit setlocal textwidth=0
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Python
au FileType python syn keyword pythonDecorator True None False self
autocmd FileType python setlocal textwidth=0 
