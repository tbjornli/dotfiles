" configuration file for vim
"execute pathogen#infect()

" enable file type detection
filetype on
filetype plugin on
filetype indent on

" colors
syntax on
set background=dark

" delete all trailing whitespace
nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" some defaults for the editor
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set autoindent      " Always set autoindenting on
set autowrite       " Automatically save before commands like :next and :make
set backspace=indent,eol,start " More powerful backspacing
set history=200     " Command line history
set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set modeline        " Apply modelines from files
set backup          " Keep a backup file
set backupdir=~/.tmp " ..and keep it out of the way
set dir=~/.tmp"
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set noerrorbells    " Evil
set ruler           " Show the cursor position all the time
set scrolloff=2     " 2 lines of context at all times
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set smartcase       " Do case sensitive matching if necessary
set textwidth=0     " Don't wrap words by default
set notitle         " no title in terminal
set ttyfast
set wildmenu
set wildmode=longest:list,full
set hlsearch
set pastetoggle=<F2>
set encoding=utf-8
set laststatus=2
set nocursorline
set colorcolumn=80

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

" Spaces > tabs
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2   " Makes backspace key treat four spaces like a tab

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Map some keys to 'functions'
map <F4> <ESC>:set nopaste!<CR>
noremap gfv :vs <cfile><cr>

:function! GetFileType()
:	let filename = tolower(bufname('%'))
:	let pos = matchend(filename, '\.') - 1
:	let len = strlen(filename) - pos
:	let fileType = strpart(filename, pos, len)
:	return fileType
:endfunction

if v:version >= 700
    " Tabs
    map <C-T> :tabnew<CR>
    imap <C-T> <C-O>:tabnew<CR>
else
    " http://vim.sourceforge.net/tips/tip.php?tip_id=173
    set wmh=0      " Minimum window height
    set wmw=0      " Minimum window width
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    nmap <C-H> <C-W>h<C-W><BAR>
    nmap <C-L> <C-W>l<C-W><BAR>
endif

" No icky toolbar, menu or scrollbars in the GUI
if has('gui')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
end

" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
endif

" Make <space> in normal mode go down a page rather than left a character
noremap <space> <C-f>

" Use default templates based on filename
let filetype = GetFileType()
let template = ''
let templateDir = '~/.vim/templates/'
if filetype == '.php'
    let template = 'php'
elseif filetype == '.sh'
    let template = 'bash'
endif

" Use template to build file
if template != ''
    let template = templateDir . template
    au BufNewFile * execute ':0r ' . template

    " Remove last line if its empty
    if getline(line('$')) == ''
        au BufNewFile * execute ':' . line('$') . 'delete 1'
    endif

    " Insert author automatically
    let author = system('finger ' . $USER . ' | grep Name | sed "s/.*Name:\ //"')
    let len = strlen(author)
    let author = strpart(author,0,len-1)
    if author != ''
        au BufNewFile * silent! execute ':%s/<vi-tpl-author>/' . author . '/g'
    endif

    " Insert time automagically
    let time = strftime('%Y-%m-%d')
    au BufNewFile * silent! execute ':%s/<vi-tpl-time>/' . time . '/g'

    " Insert tab-settings automagically
    let tabsettings = system('cat ~/.vim/templates/tabsettings')
    let tabsettings = substitute(tabsettings, '\n', '\r', 'g')
    au BufNewFile * silent! execute ':%s/<vi-tpl-tabsettings>\n/' . tabsettings . '/g'
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Smartindent for Python files. Auto-indent to next level after a keyword
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Trim trailing whitespace in Python scripts
au BufWritePre *.py normal m`:%s/\s\+$//e ``

" Set filetypes from extension
au BufNewFile,BufRead .torsmorc* set filetype=rc
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.sys set filetype=php
au BufNewFile,BufRead grub.conf set filetype=grub

if ($TERM == "rxvt-unicode") && (&termencoding == "")
    set termencoding=utf-8
endif

" auto-fix annoying typos
iab teh the
command W w
command Q q

" tip from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

cmap w!! %!sudo tee > /dev/null %

" Set up the status line
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun

call <SID>SetStatusLine()
