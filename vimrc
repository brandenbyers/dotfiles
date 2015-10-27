" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=1000
set undolevels=1000
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set clipboard=unnamedplus,unnamed,autoselect,exclude:.* "Make yank copy to system clipboard
set shortmess +=I " hide VIM intro message
set timeoutlen=1000 ttimeoutlen=0 " eliminate delays on ESC
set foldlevelstart=20
set ttyfast " send more character for redraws
set mouse=a " enable mouse use in all modes
set ttymouse=xterm2

imap <C-c> <CR><Esc>O

" Save file
inoremap <c-s> <Esc>:Update<CR>

" Better pasting with indentation
nnoremap <leader>p p`[v`]=`]`

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Vim markdown highlight YAML frontmatter
let g:vim_markdown_frontmatter=1

" Softtabs, 4 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
"set wildmode=list:longest,list:full
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Index ctags from any project
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" " Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Airline Fonts
let g:airline_powerline_fonts = 1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Highlight previous after indentation
:vnoremap < <gv
:vnoremap > >gv

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=0
let g:syntastic_html_tidy_ignore_errors=["plain text isn't allowed in <head> elements", " proprietary attribute \"ng-", "trimming empty <span>", "is not recognized!", "discarding unexpected"]
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'
let g:syntastic_javascript_checkers=['eslint']

" configure YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" " configure delimitMate
" let g:delimitMate_expand_cr = 1
" let g:delimitMate_expand_space = 1

" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""

" Mustache Handlebars config
let g:mustache_abbreviations = 1

" Set solarized dark
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
call togglebg#map("")

" Vim Slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" Vim Sneak
let g:sneak#streak = 1

" CoffeeScript
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>
" command -nargs=1 C CoffeeCompile | :<args>

" TernJS
let g:tern_map_keys = 1
let g:tern_map_prefix = '<leader>'

" Vim Pad directory
let g:pad#dir = "/Users/branden/Dropbox/Notes/fermup"
let g:pad#search_backend = "ag"
let g:pad#window_height = 42

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
