" Basic Settings {{{

set nocompatible " Use vim settings instead of Vi settings
set encoding=utf-8
set modelines=1 " only use the modeline at the bottom of this file, not all files
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set nojoinspaces " Use one space, not two, after punctuation.
set textwidth=80 " Make it obvious where 80 characters is
set colorcolumn=+1
set hlsearch  " highlights matches
set cursorline  " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we hvae to (not during macros)
set showmatch " highlight matching [{()}]
set scrolloff=8 " Always show at least eight line above/below the cursor
set report=0 " always show changes (e.g. 3 lines yanked at the bottom)
set nowrap " Don't wrap lines
set linebreak "Wrap lines at convenient points
set autoread " Reload files changed outside vim
set autoindent
set fileformat=unix
set smartindent " code-dependent version of indent (also most have autoindent on)
set ls=2 " show a status line even when one window is shown
set ignorecase " Use case insensitive search
set smartcase " except when using capital letters
set listchars=eol:¬,trail:~,extends:>,precedes:<,tab:>-
set list " Display extra whitespace according to listchars
set visualbell " Use visual bell instead of beeping when doing something wrong
set cmdheight=2 " Avoids many cases of having to "press <Enter> to continue"
set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings
set splitbelow " Open new split panes to the bottom
set splitright " Open new split panes to the right
set complete+=kspell " Autocomplete with dictionary words when spell check is on
set diffopt+=vertical " Always use vertical diffs
set hidden " Without this, you can have edited buffers that aren't visible in a window somewhere.
set t_vb= " And reset the terminal code for the visual bell.
set confirm " Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set tabstop=4 " Softtabs, 4 spaces
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab " tabs are shortcut for 4 spaces

scriptencoding utf-8

let mapleader = "," " Leader=,
let g:is_posix = 1 " When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.

filetype indent on " load filetype-specific indent files
filetype plugin indent on

" }}}

" Shortcuts {{{
" Leader Shortcuts {{{

nnoremap <leader><leader> <c-^> " Switch between the last two files

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>x :wq<CR>

" turn off search highlight - vim will keep highlighted matches from previous searches
nnoremap <leader><space> :nohlsearch<CR>

" }}}

" Other Shortcuts {{{

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map Y to act like D and C, rather than act as yy, which is the default
map Y y$

" }}}
" }}}

" Plugins {{{
" Runtimepath {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/vim-fugitive
set runtimepath^=~/.vim/bundle/vim-gitgutter
set runtimepath^=~/.vim/bundle/vim-airline
set runtimepath^=~/.vim/bundle/YouCompleteMe
set runtimepath^=~/.vim/bundle/syntastic
set runtimepath^=~/.vim/bundle/tagbar
set runtimepath^=~/.vim/bundle/vim-signify
set runtimepath^=~/.vim/bundle/vim-tmux-navigator
set runtimepath^=~/.vim/bundle/vim-commentary
set runtimepath^=~/.vim/bundle/vim-nerdtree-tabs
" }}}

" NERDTree {{{
" Toggle nerdtree with F10
map <leader>n :NERDTreeTabsToggle<CR>

" Current file in nerdtree
map <leader>f :NERDTreeTabsFind<CR>

" hide pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Auto open NERDTree on startup and adjsut focus to main window
autocmd VimEnter * NERDTree | wincmd p

" On startup, focus NERDTree if opening a directory, file if opening a file
let g:nerdtree_tabs_smart_startup_focus=1

" Open NERDTree on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)
let g:nerdtree_tabs_open_on_new_tab=1

let NERDTreeShowHidden=1 " Show hidden files in NerdTree
" }}}

" Syntastic {{{

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Suggested Settings from Syntastic's GitHub page
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=\ %=%#warningmsg#
set statusline+=\ %=%{SyntasticStatuslineFlag()}
set statusline+=\ %=%*

" }}}

" YouCompleteMe {{{

" Ensures AutoComplete window goes away when we're done with it
let g:ycm_autoclose_preview_window_after_completion=1
" leader-g for GoTo
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}

" Tagbar {{{

nmap <leader>t :TagbarToggle<CR>

" Open Tagbar automatically if opening a supported file type
autocmd VimEnter * nested :call tagbar#autoopen(1)

" Open Tagbar automtically in a new tab for a supported file type
autocmd BufEnter * nested :call tagbar#autoopen(0)

" }}}

" Matchit {{{

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" Ag {{{

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" }}}
" }}}

" File Specific {{{
" Java {{{

" Turn off Eclim code validation so syntastic can run (if set to 0)
let g:EclimJavaValidate = 1

let g:EclimCompletionMethod = 'omnifunc'

" Eclim - Import the class under the cursor
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>

" Eclim - Search the javadocs of the element under the cursor
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>

" Eclim - Perform a context sensitive search of the element under the cursor
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

" Eclim - Code Correction Suggestion
nnoremap <silent> <buffer> <leader>a :JavaCorrect<cr>

" properly auto-insert matched block delimiters
autocmd Syntax c,cpp,java,php,perl imap { {<CR>}<Esc>O

" F5 compiles and runs Java class
autocmd FileType java nnoremap <buffer> <leader>r :!javac % ; java %:r<cr>

" }}}

" Python {{{

" F5 runs the python module
autocmd FileType python nnoremap <buffer> <leader>r :!python %<cr>

let python_highlight_all=1

" Add Conda environment to PYTHONPATH for YouCompleteMe
if !empty($CONDA_DEFAULT_ENV)
    :let $PYTHONPATH="/home/nick/programs/miniconda3/envs/"
    :let $PYTHONPATH.=$CONDA_DEFAULT_ENV
    :let $PYTHONPATH.="/lib/python3.6/site-packages/"
endif

" }}}

" Html/Javascript {{{

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" }}}
" }}}

" Other Features {{{ 
" Tab Completion {{{

" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" }}}

" Folding {{{

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max

" space open/closes folds
nnoremap <space> za
set foldmethod=indent " fold based on indent level

" }}}

" Copy/Paste {{{

" "key to insert mode with paste
map <leader>p :set paste<CR>
" Leave paste mode on exit
au InsertLeave * set nopaste

" }}}

" Line Numbers {{{

" Toggle between absolute and relative numbers with Ctrl + N
" Set Relative Line Numbers by default
set relativenumber
nnoremap <C-n> :set relativenumber!<cr>

" <leader>p allows you to copy/paste easily with the mouse
map <leader>c :set relativenumber!<CR>:set number!<CR>:set list!<CR>

" }}}

" }}}

" Colors {{{

"colors koehler
"colorscheme darcula
colorscheme solarized
set background=dark

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" }}}

" Custom Functions {{{

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" }}}

" this goes at the bottom of the file
" vim:foldmethod=marker:foldlevel=0
