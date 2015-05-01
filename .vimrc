" vim:foldmethod=marker:foldlevel=0:tabstop=2:expandtab
execute pathogen#infect()
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" backup/persistance settings {{{
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
endif
" }}}

" persist (g)undo tree between sessions {{{
set undofile
set history=100
set undolevels=100
" }}}

" UI {{{
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
setl number		" show line numbers
set wildmenu		" visual autocomplete for command menu
set lazyredraw		" redraw only when we need to
set showmatch		" highlight matching [()]
set cpoptions+=n
set smartcase

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd VimEnter,WinEnter * match ExtraWhitespace /\s\+$/
" }}}


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands. {{{
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd") }}}

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Folding {{{
set foldenable			" enable folding
set foldlevelstart=10		" open most folds by default
set foldnestmax=10		" 10 nested fold max
" space to open/close folds
nnoremap <space> za
" }}}

set modelines=1     " parse head/foot modelines for vim settings

" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" Airline {{{
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1
let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
" }}}

set laststatus=2

" Syntastic {{{
let g:syntastic_ruby_checkers = ['ruby', 'mri','ruby-lint','rubocop']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_js_checkers = ['jshint','jslint']
let g:syntastic_ruby_exec = "ruby"
"let g:syntastic_cfml_checkers = ['cflint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_ruby_checker = 1
let g:echodoc_enable_at_startup = 1
let g:syntastic_html_tidy_ignore_errors = ["proprietary attribute \"ng-"]
let g:syntastic_mode_map = {'mode':'active','active _filetypes': [], 'passive_filetypes':['html']}
let g:used_javascript_libs = 'jquery,angularjs'
" let g:syntastic_quiet_messages = { "type": "style" }
" }}}


" Spleling for comments and strings
set nospell spelllang=en_us

nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Colors {{{
set background=dark
set t_Co=256
let g:solarized_termcolors=256
" colorscheme default
color molokai
" }}}

set gdefault
set clipboard=unnamed
" set scrolloff=2
" highlight embedded code
let perl_extended_vars=1
let php_sql_query=1
let php_htmlInString=1
let php_folding=1
let php_parent_error_close=1
let html_use_css=1
set ttyfast
set ttybuiltin
set guipty " allegedly improves terminal emulation
set splitright
set viewoptions=folds,localoptions,cursor

" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"  }}}

" Emmet settings {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

autocmd QuickFixCmdPost *grep* cwindow

" YouCompleteMe {{{
"   requires:
"      apt-get install build-essential cmake python-dev
"      cd ~/.vim/bundle/YouCompleteMe
"      git submodule update --recursive --init
"      ./install.sh --clang-completer
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}


