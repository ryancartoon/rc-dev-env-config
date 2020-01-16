
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" A solid language pack
Plug 'sheerun/vim-polyglot'

" Management of tags files
Plug 'ludovicchabant/vim-gutentags'

Plug 'psf/black'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
" Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'benmills/vimux'
Plug 'vim-scripts/taglist.vim'
Plug 'plasticboy/vim-markdown'
Plug 'henrik/vim-indexed-search'
Plug 'vim-scripts/matchit.zip'
Plug 'fatih/vim-go'
Plug 'amoffat/snake'
Plug 'terryma/vim-expand-region'
Plug 'mileszs/ack.vim'

" auto completion
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" ale
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'


"Color scheme
Plug 'altercation/solarized'
Plug 'ajh17/Spacegray.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'romainl/Apprentice'
Plug 'freeo/vim-kalisi'
Plug 'gilgigilgil/anderson.vim'
Plug 'joshdick/onedark.vim'


" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
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
set t_vb=
set tm=500

set relativenumber

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set linespace=0
set nowrap
set nu
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*




" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 26
" autocmd vimenter * NERDTree


let g:ctrlp_max_height = 50
set wildignore+=tmp\*,*.swp,*.zip,*.exe,*.tag,*.tar,*.c,*.dll,*.git,*.sit    " Windows
let g:ctrlp_extensions = ['tag', 'buffertag', 'ssh',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange
"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline




""""""""""""""""""""""""""""""
" keyborad mappings
""""""""""""""""""""""""""""""


if has("gui_running")
    " gui options
    set guioptions-=T
    set guioptions-=e
    set guioptions-=L
    set t_Co=256
    set guitablabel=%M\ %t
    set guioptions -=m
    set guioptions-=r "scrollbar
    set guioptions-=l "scrollbar

    " set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
    " set guifont=Ubuntu\ Mono\ 11
    "colorscheme gruvbox
    "colorscheme jellybeans
    "colorscheme molokai
    "colorscheme Tomorrow-Night-Bright
    "colorscheme Tomorrow-Night
    "colorscheme spacegray
    " colorscheme solarized
    colorscheme pencil

    if has('win32') || has('win64')
        set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,
                    \geom:1,renmode:5,taamode:1
        set guifont=Operator_Mono_Book:h9
    elseif has("mac") || has("macunix")
      set guifont=Monaco:h11
    else
        set guifont=Operator\ Mono\ weight=330\ 11
    endif
else
    colorscheme Tomorrow-Night-Bright
endif


if has('win32') || has('win64')
    let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

" fun SetAppDir()
"     if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
"         let g:last_relative_dir = expand("%:h") . '/'
"         return ''
"     endif
" endfun
" autocmd BufEnter *.py call SetAppDir()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

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

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif



""""""""""""""""""""""""""""""
" customized functions
""""""""""""""""""""""""""""""

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


map K <Plug>(expand_region_expand)
vmap J <Plug>(expand_region_shrink)

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>


nnoremap <C-b> <PageUp>
nnoremap <C-f> <PageDown>
map <C-Tab> :tabnext<cr>
set cursorline

imap jj <ESC>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" When you press <leader>h you can search and replace the selected text
vnoremap <silent> <leader>h :call VisualSelection('replace')<CR>
"nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

noremap <leader>qq :q<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mapping and setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => ctrl-p
""""""""""""""""""""""""""""""
"let g:loaded_ctrlp = 1
"let g:ctrlp_dotfiles = 0
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_working_path_mode = 'rc'
"let g:ctrlp_map = '<c-p>'
map <leader>ff :CtrlPCurWD<cr>
map <leader>f :CtrlPMRUFiles<cr>
map <leader>fb :CtrlPBookmarkDir<cr>
map <leader>t :CtrlPTag<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>t :CtrlPBufTag<cr>
map <leader>fq :ctrlpquickfix<cr>
map <leader>ed :ctrlpdir<cr>
map <leader>fu :ctrlpundo<cr>
map <leader>fl :ctrlpline<cr>
map <leader>fc :ctrlpchange<cr>
map <leader>fca :ctrlpchangeall<cr>
map <leader>fm :ctrlpmark<cr>


" vim-go

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" easyclip
let g:EasyClipAutoFormat = 1
let g:EasyClipDoSystemSync = 1
let g:EasyClipUseYankDefaults = 1
let g:EasyClipUseCutDefaults = 1
let g:EasyClipUsePasteDefaults = 1
let g:EasyClipEnableBlackHoleRedirect = 1
let g:EasyClipUsePasteToggleDefaults = 1

let g:EasyClipUseCutDefaults = 0
let g:EasyClipUsePasteToggleDefaults = 0


" let g:airline_theme='badwolf'
" let g:airline_theme='pencil'

" others

nmap <Leader>x <Plug>MoveMotionPlug
xmap <Leader>x <Plug>MoveMotionXPlug
nmap <Leader>xx <Plug>MoveMotionLinePlug

nmap <Leader>vf <plug>EasyClipSwapPasteForward
nmap <Leader>vb <plug>EasyClipSwapPasteBackwards


" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

let g:ale_linters = {
    \   'go': ['gometalinter', 'gofmt'],
    \}

let g:deoplete#enable_at_startup = 1
