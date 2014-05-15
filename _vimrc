""""""""""""
" Behaviour

" Incompatible with vi 
set nocompatible 

" ignore case when searching
set ignorecase 
" case sensitive search only if uppercase characters are used 
set smartcase 
" highlight search term while typing 
set incsearch

" encoding
set encoding=utf8

" EOL settings
set ffs=unix,dos,mac

" no backups
set nobackup
set nowb
set noswapfile

" allow modified/unsaved buffers
set hid

" hide buffers instead of deleting them
set bufhidden=hide

" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" selection includes the last character
set selection=inclusive

" right click extends selection
set mousemodel=extend


" disable auto insertion of comments
autocmd BufEnter * set formatoptions-=cro

set viminfo=

" disable annoying formatting for html
let html_no_rendering=1

" disable searching in include files for autocomplete
set complete-=i

" maintain the current column after various commands
set nostartofline

" splitting a window will put it below the current one.
set splitbelow
" splitting a window will put it to the right of the current one.
set splitright

" keep 1 line visible at top/bottom of screen
set scrolloff=1
" keep 5 chars visible at sides of screen 
set sidescrolloff=5

if has("win32")
  set shell=cmd
endif

"""""""""""
" GUI setup

if has("gui_running")
  " remove menu bar
  set guioptions-=m 
  " remove toolbar
  set guioptions-=T 
  " remove left scroll bar
  set guioptions+=Ll
  set guioptions-=Ll

  if has("X11")
    set guifont=Monospace\ 12,Consolas\ 11,Courier\ New\ 10
  else
    set guifont=Ubuntu_Mono:h12,Consolas:h11,Courier_New:h10
  endif

  set lines=40 
  set columns=130

  set foldcolumn=3

  if has("win32") 
    " maximize corectly
    au GUIEnter * simalt ~x 
  endif
endif

colorscheme meditation

" fill vertical bar with dots
set fillchars+=vert:.

"""""""""""
" Interface

" Turn on WiLd menu
set wildmenu 

" always show position
set ruler 

"""""""""""""""
" Key mappings

" setup leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","

" Use the arrows to something usefull
map <up> <nop>
map <down> <nop>

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

vmap <C-x> "+x
smap <C-x> <C-g>"+x
nmap <silent> <C-X> :call CutNonEmptyLineToClipboard()<CR>

" If the current line is non-empty cut it to the clipboard
" An empty line is put into the black hole registry
function! CutNonEmptyLineToClipboard()
    " if strlen(getline('.')) != 0
    if match(getline('.'), '^\s*$') == -1
        normal 0"+D
    else
        normal "_dd
    endif
endfunction

" CTRL-C is Copy
vmap <C-C> "+y

" CTRL-V is Paste
map <C-V>	"+gP

" enable Paste in command mode
cmap <C-v> <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR><Esc>

" Bufstop way to get to the previous buffer 
nmap <C-tab> <leader>2
vmap <C-tab> <leader>2

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo in insert mode
inoremap <C-Y> <C-O><C-R>
" CTRL-C to copy text from cmd line
cnoremap <C-c> <C-y>

" mappings for F3
nmap <F3> *zz 
nmap <S-F3> #zz

" search inside project with F4 (via Bufstop-search)
nmap <F4> :Bck<CR>

" better movement in command line
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" remap : in select mode, which normally inserts text
smap : <Esc>:

" leader mappings

" close(wipe) the current buffer withot closing the window 
map <leader>d :BufstopBack<CR>:bw #<CR>

noremap <leader>ff :let @+=expand("%:p")<CR>
noremap <leader>fn :let @+=expand("%")<CR>
noremap <leader>fp :let @+=expand("%:p:h")<CR>

map <leader>e :silent r! explorer .<CR>

map <leader>b :Bufstop<CR>
map <leader>a :BufstopModeFast<CR>
map <leader>q :BckOpen<CR>

" if has("win32")
"  map <leader>c :!start cmd<CR>
" end

nmap <leader>z :let &scrolloff=999-&scrolloff<CR>

" awesome keyboard scrolling
nmap <C-j> 3j3<C-e>
nmap <C-k> 3k3<C-y>

" insert line in normal mode
" nmap <C-Space> mpo<Esc>`p
nmap <C-Space> o<Esc>

" change current dir, replaces:
"   set autochdir
"   autocmd BufEnter * lcd %:p:h
nmap <leader>cd :cd\ %:p:h<CR>

""""""""""""""""
" Abbreviations

cabbrev ss VimpanelSessionMake
cabbrev sl VimpanelSessionLoad
cabbrev vp Vimpanel
cabbrev vl VimpanelLoad
cabbrev vc VimpanelCreate
cabbrev ve VimpanelEdit
cabbrev vo VimpanelOpen
cabbrev vr VimpanelRemove

""""""""""""""
" Indentation

set expandtab 
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

set autoindent
set nosmartindent
set nocindent

set indentexpr=GetIndent()

function! GetIndent()
   let lnum = prevnonblank(v:lnum - 1)
   let ind = indent(lnum)
   return ind
endfunction


" keep autoindent after moving cursor in insert mode 
set cpoptions+=I

" disable limit on inserted text
set textwidth=0 
" long lines don't break at screen end
set nowrap 

" when at end of screan, scroll only 5 characters
set sidescroll=5 
" long lines are market with > and < at end of screen
set listchars+=precedes:<,extends:>

""""""""""""""
" Status line

set laststatus=2
set statusline=
set statusline+=%1*                   "switch to User1 highlight
set statusline+=%n                    " buffer number
set statusline+=%1*                   
set statusline+=%{'/'.bufnr('$')}\    " total buffers
set statusline+=%2*                   
set statusline+=%<%1.100F              " filename
set statusline+=%3* 
set statusline+=\ %y%h%w              " filetype, help, example flags
set statusline+=%3* 
set statusline+=%r%m                  " read-only, modified flags
set statusline+=%3* 
set statusline+=%=\                   " indent right
set statusline+=%1* 
set statusline+=%l                    " line number
set statusline+=%1* 
set statusline+=/%{line('$')}         " total lines
set statusline+=%1* 
set statusline+=,                     " ,
set statusline+=%1* 
set statusline+=%c%V                  " [virtual] column numberV
set statusline+=%3* 
set statusline+=\                     " [ ]
set statusline+=%3* 
set statusline+=%<%P                  " percent

""""""""""
" Plugins

filetype off

" Pathogen
call pathogen#infect()

filetype plugin indent on

" CtrlP - use project directory as search root
let g:ctrlp_working_path_mode='r'

" Easy motion 
" let g:EasyMotion_leader_key = 'g'
nmap ss <Plug>(easymotion-s2)
nmap st <Plug>(easymotion-t2)
map sh <Plug>(easymotion-lineforward)
map sj <Plug>(easymotion-j)
map sk <Plug>(easymotion-k)
map sl <Plug>(easymotion-linebackward)
map  s/ <Plug>(easymotion-sn)
omap s/ <Plug>(easymotion-tn)
map  sn <Plug>(easymotion-next)
map  sN <Plug>(easymotion-prev)
map sw <Plug>(easymotion-w)
map sb <Plug>(easymotion-bd-w)
map se <Plug>(easymotion-e)

let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'asdghkqwertyuiopzxcvbnmfjl'

" vim-shell disable all mappings
let g:shell_mappings_enabled = 0

" bufstop
let g:BufstopAutoSpeedToggle = 1
let g:BufstopSplit = "topleft"

" Bck
let g:BckPrg = 'ag --nocolor --nogroup --column'

" Vimpanel
let g:VimpanelStorage = '~/.vimpanel'

""""""""""
" Commands

" show highlight group
command! Hgroup :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " 
                  \ . "trans<". synIDattr(synID(line("."),col("."),0),"name") . "> " 
                  \ . "lo<". synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

" find text in all open buffers (in case Bck doesn't work)
function! Findb(text)
    exe "cex [] | silent! bufdo vimgrepa /" . a:text . "/ %"
    :copen
endfunction
command! -nargs=1 Findo call Findo(<q-args>)

"""""""""""""""""""""
" File type settings

autocmd FileType markdown setlocal tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType vim setlocal iskeyword-=# 
autocmd FileType ruby setlocal iskeyword-=:
autocmd FileType css,scss,html,eruby setlocal iskeyword +=-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set secure

