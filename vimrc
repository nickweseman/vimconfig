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
set lazyredraw " redraw only when we have to (not during macros)
set showmatch " highlight matching [{()}]
set scrolloff=10 " Always show at least ten line above/below the cursor
set report=0 " always show changes (e.g. 3 lines yanked at the bottom)
set wrap " wrap lines
set formatoptions-=t " turn off autowrap but still show the vertical line
set formatoptions+=l " if a line is longer than textwidth when insert starts, don't reformat it
set formatoptions+=1 " don't wrap after a one letter word, wrap before
set formatoptions+=j " delete comment leaders when joining lines
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
set shiftround " make sure indentions are always a multiple of 4
set expandtab " tabs are shortcut for 4 spaces
set wildmode=list:longest,list:full " will insert tab at beginning of line, will use completion if not at beginning
set shortmess+=I " remove startup message when starting Vim
set dictionary=/usr/share/dict/words
" ~/.vim/custom-dictionary is version controlled, ~/.vim-local-dictionary.utf-8 is not
set spellfile=~/.vim/custom-dictionary.utf-8.add,~/.vim-local.dictionary.utf-8.add
nnoremap zG 2zg " zG adds a word to the local dictionary, zg adds to custom dictionary
set synmaxcol=800 " Don't try to highlight lines longer than 800 characters.
set gdefault " skip /g for searches because it will search globally by default
set nojoinspaces " avoid double spaces when joining lines
set sidescroll=1 " scroll sideways a character at a time, not a screen at a time
set sidescrolloff=5 " show 5 characters of context when side scrolling
set matchpairs=(:),{:},[:],<:> " match all forms of brackets in pairs

" Don't bother about checking whether Escape is being used as a means to enter
" a Meta-key combination, just register Escape immediately
set noesckeys

" Improve redrawing smoothness by assuming that my terminal is reasonably fast
set ttyfast


" Only show cursor line in current window and insert mode
au WinLeave,InsertLeave * set nocursorline
au WinEnter,InsertLeave * set cursorline

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
nmap <leader>s :wq<CR>

" turn off search highlight - vim will keep highlighted matches from previous searches
nnoremap <leader><space> :nohlsearch<CR>

"Move back and forth through previous and next buffers
"with <leader>z and <leader>x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>

" Windows splits with vv (vertical) and ss (horizontal)
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" execute current line as a vim command
nmap <silent> <leader>vc yy:<C-f>p<Esc><CR>

" reload file
nmap <silent> <leader>vr :so %<CR>

" open editor to shortcut file
nnoremap <leader>ev :vsplit ~/.vim/vimrc<CR>
nnoremap <leader>et :vsplit ~/.tmux/.tmux.conf<CR>
nnoremap <leader>eb :vsplit ~/.bash/.bashrc<CR>

" Map Ctrl-x and Ctrl-z to navigate the quickfix error list (normally :cn and :cp)
nnoremap <silent> <C-x> :cn<CR>
nnoremap <silent> <C-z> :cp<CR>

" Go to next/previous function
nnoremap <silent> <leader>j ]m
nnoremap <silent> <leader>k [m

nnoremap <C-c> :bp\|bd #<CR>

nnoremap <leader>_ mz:%s/\s\+$//<cr>:let @/=''<cr>`z " Clean trailing whitespace

" C-t - turn word you just typed into all UPPER_CASE while still in insert mode
inoremap <C-t> <ESC>mzgUiw`za

" Split line (sister to Join lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" "Zip Right" a character to the end of the line
" e.g. println()foo -> println(foo)
nnoremap zr :let @z=@"<cr>x$p:let @"=@z<cr>

" edit custom dictionary
nnoremap <leader>ed :vsplit ~/.vim/custom-dictionary.utf-8.add<cr>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP


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

" simplify resizing window panes
" this method came from: http://stackoverflow.com/a/16600458/7906399
" to get the unix escape key to replace ^[:  i(inert mode) then C-v then Esc
if has('unix')
    nnoremap j <C-w>-
    nnoremap k <C-w>+
    nnoremap h <C-w><
    nnoremap l <C-w>>
else
    nnoremap <M-j> <C-w>-
    nnoremap <M-k> <C-w>+
    nnoremap <M-h> <C-w><
    nnoremap <M-l> <C-w>>
endif

" Map Y to act like D and C, rather than act as yy, which is the default
map Y y$

" w!! - to write a file as sudo
cmap w!! w !sudo tee % >/dev/null

" Center screen on search results
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap { {zz
nnoremap } }zz
nnoremap g; g;zz
nnoremap g, g,zz

" j and k treat wrapped lines normally
nnoremap j gj
nnoremap k gk

" list navigation (also use C-x and C-z for :cpprev and :cnext)
nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz

" Tab is much easier to type
map <TAB> %

" Reselect last-pasted text
nnoremap gv `[v`]

" Don't move on *
nnoremap * *<C-o>

" Easier to type
noremap H ^
noremap L g_

" Bash style beginning and end of line only in insert and command mode
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Send chars deleted with 'x' to the black hole
nnoremap x "_x

" Start an external command with just !
nnoremap ! :!

" Don't move the screen when joining lines
nnoremap J mzJ`z

" Preserve the flags for a pattern when repeating a substitution with &; I don't
" really understand why this isn't a default, but there it is
nnoremap & :&&<CR>
vnoremap & :&&<CR>

" }}}
" }}}

" Plugins {{{

" Runtimepath {{{

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/vim-nerdtree-tabs
set runtimepath^=~/.vim/bundle/vim-fugitive " git commands within vim
set runtimepath^=~/.vim/bundle/vim-lawrencium " hg commands within vim 
set runtimepath^=~/.vim/bundle/vim-gitgutter " show vim diff in sign column (git)
set runtimepath^=~/.vim/bundle/vim-signify " show vim diff in sign column (hg, others)
set runtimepath^=~/.vim/bundle/vim-airline " statusbar
set runtimepath^=~/.vim/bundle/vim-airline-themes " solarized theme (actually chose others)
set runtimepath^=~/.vim/bundle/YouCompleteMe
set runtimepath^=~/.vim/bundle/syntastic
set runtimepath^=~/.vim/bundle/tagbar
set runtimepath^=~/.vim/bundle/vim-tmux-navigator " C-hjkl to switch
set runtimepath^=~/.vim/bundle/vim-commentary " gcc
set runtimepath^=~/.vim/bundle/ag.vim " Ag: (\)
set runtimepath^=~/.vim/bundle/vim-tmux-resizer " A-hjkl to resize
set runtimepath^=~/.vim/bundle/vim-action-ag " gagiw (<leader>a)
set runtimepath^=~/.vim/bundle/vim-easymotion " <leader><leader>w to for easy word motion
set runtimepath^=~/.vim/bundle/vim-closetag " auto-closes html/xml tags (<html>> to close on next line)

" }}}

" NERDTree {{{

" Toggle nerdtree with F10
map <leader>n :NERDTreeToggle<CR>

" Current file in nerdtree
map <leader>f :NERDTreeFind<CR>

" hide pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Auto open NERDTree on startup and adjust focus to main window
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
let g:syntastic_check_on_open = 0 " don't check on open, it was too slow
let g:syntastic_check_on_wq = 0
set statusline+=\ %=%#warningmsg#
set statusline+=\ %=%{SyntasticStatuslineFlag()}
set statusline+=\ %=%*

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_html_checkers = ['tidy']

" }}}

" EasyMotion {{{

" v searches for v and V, but V searches only for V
let g:EasyMotion_smartcase = 1

" }}}

" YouCompleteMe {{{

" Ensures AutoComplete window goes away when we're done with it
let g:ycm_autoclose_preview_window_after_completion=1

map <leader>g :YcmCompleter GoTo<CR>" Go To
map <leader>e :YcmCompleter GoToReferences<CR>" Find All References

" }}}

" Tagbar {{{

nmap <leader>t :TagbarToggle<CR>

" Open Tagbar automatically if opening a supported file type
autocmd VimEnter * nested :call tagbar#autoopen(1)

" Open Tagbar automatically in a new tab for a supported file type
autocmd BufEnter * nested :call tagbar#autoopen(0)

" Ensure quickfix window opens in the bottom middle pane instead of right pane
" under tagbar
:autocmd FileType qf wincmd J
" }}}

" CtrlP {{{

" Additional mapping for buffer search
nnoremap <silent> <leader>b :CtrlPBuffer<cr>

let g:ctrlp_cmd = 'CtrlP' " C-p searches from the current directory

noremap <C-a> :CtrlP ~<CR> " C-a searches from ~ directory
noremap <leader>m :CtrlPMRU<CR>

" Search for the nearest parent folder that contains .hg/.git/.vats from current
" working directory (not file's directory)
let g:ctrlp_working_path_mode = 'wa'

let g:ctrlp_show_hidden = 1

let g:ctrlp_root_markers = ['.vats']

" }}}

" Matchit {{{
"

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

    " Start searching from project root instead of cwd
    let g:ag_working_path_mode="r"

    " Automatically close VIM if quickfix window is only remaining window open
    aug QFClose
        au!
        au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
    aug END

    if !exists(":Ag")
        command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        nnoremap \ :Ag<SPACE>

        " Search Ag for current word
        nmap <leader>a <Plug>AgActionWord

        let g:ackprg = 'ag --vimgrep'
    endif
endif

" }}}

" Vim-Airline {{{

" Enable tabline to hold buffers as well
let g:airline#extensions#tabline#enabled = 1

" Only show the filename in the tab
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_theme='badwolf'
" I don't like how the solarized airline theme looks
" let g:airline_solarized_normal_green=1
" let g:airline_solarized_bg='dark'

" }}}
" }}}

" File Specific {{{
" Java {{{

" Turn off Eclim code validation so syntastic can run (if set to 0)
let g:EclimJavaValidate = 1
let g:EclimHtmlValidate = 0
let g:EclimCssValidate = 0

let g:EclimCompletionMethod = 'omnifunc'

" Eclim - Import the class under the cursor
autocmd FileType java nnoremap <buffer> <leader>ji :JavaImport<cr>

" Eclim - Perform a context sensitive search of the element under the cursor
autocmd FileType java nnoremap <buffer> <cr> :JavaSearchContext<cr>

" Eclim - Code Correction Suggestion
autocmd FileType java nnoremap <buffer> <leader>ja :JavaCorrect<cr>

" Eclim - Organize Imports
autocmd FileType java nnoremap <buffer> <leader>jo :JavaImportOrganize<cr>

" Eclim - Add javadocs
autocmd FileType java nnoremap <buffer> <leader>j8 :JavaDocComment<cr>

" Eclim - Auto format
autocmd FileType java nnoremap <buffer> <leader>j9 :JavaFormat<cr>

" Search from project root
autocmd FileType java nnoremap <leader>\ :ProjectGrep<SPACE>

" properly auto-insert matched block delimiters
autocmd FileType c,cpp,java,php,perl,css,javascript imap { {<CR>}<Esc>O

" F5 compiles and runs Java class
autocmd FileType java nnoremap <buffer> <leader>jr :!javac % ; java %:r<cr>

autocmd FileType java nnoremap <F7> :JavaDebugStep into<CR>
autocmd FileType java nnoremap <F8> :JavaDebugStep over<CR>
autocmd FileType java nnoremap <F9> :JavaDebugStep return<CR>

autocmd FileType java nnoremap <F10> :JavaDebugBreakpointToggle<CR>

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

" Folding {{{

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" space open/closes folds
nnoremap <space> za

" }}}

" Copy/Paste {{{

" Prepare to copy/paste with the mouse
nnoremap <leader>p :set paste<CR>
nnoremap <leader>c :set relativenumber!<CR>:set number!<CR>:set list!<CR>:SignifyToggle<CR>:NERDTreeToggle<CR>

au InsertLeave * set nopaste " Leave paste mode on exit

" you can click and drag mouse to copy to Windows clipboard
" set mouse=a

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" }}}

" Line Numbers {{{

" Set Relative Line Numbers by default
set relativenumber
set number

" Toggle between absolute and relative numbers with Ctrl + N
nnoremap <C-n> :set relativenumber!<cr>


" }}}

" }}}

" Colors {{{

"colors koehler
"colorscheme darcula
colorscheme solarized
set background=dark
highlight clear SignColumn " this doesn't work in vim-signify for some reason, so for now have to keep using vim-gitgutter to get this behavior

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

" End {{{
" this goes at the bottom of the file
" }}} vim:foldmethod=marker:foldlevel=0
