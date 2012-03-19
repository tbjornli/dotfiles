" Configuration file for vim
syntax on

" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" some defaults for the editor 
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set autoindent      " Always set autoindenting on
set autowrite       " Automatically save before commands like :next and :make
set background=dark " Black power!
set backspace=indent,eol,start " More powerful backspacing
set history=200     " Command line history
set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set modeline        " Apply modelines from files
set backup          " Keep a backup file 
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

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50    

" Spaces > tabs
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4   " Makes backspace key treat four spaces like a tab

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Map some keys to 'functions'
map <F2> o/**<CR> *<CR>*<CR>* @access <CR>* @return <CR>*/<ESC>kkkk<END>a 
map <F3> o/**<CR> *<CR>* @var <CR>*/<ESC>kk<END>a 
map <F4> <ESC>:set nopaste!<CR>
noremap gfv :vs <cfile><cr>

if v:version >= 700
    " Tabs
    map <C-T> :tabnew<CR>
    imap <C-T> <C-O>:tabnew<CR>

    let loaded_matchparen = 1 " disables vim7's paranthesis matching
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

" Run the test for this file if it exists
map tr <ESC>:echo Run_test() <CR>
map to <ESC>:execute Open_test() <CR>
map fc <ESC>:execute CreateFunction() <CR>

" Lets you create a function quicker
:function! CreateFunction()
:	let name = input('Function name')
:	let line = line('$')
:	call append(line-1, '/**')
:	call append(line, ' *')
:	call append(line+1, ' * @access ')
:	call append(line+2, ' * @return ')
:	call append(line+3, ' */')
:	call append(line+4, 'function ' . name . '() {')
:	call append(line+5, '')
:	call append(line+6, '}')
:	call cursor(line+5, 0)
:	return 0
:endfunction

:function! GetFileType()
:	let filename = tolower(bufname('%'))
:	let pos = matchend(filename, '\.') - 1
:	let len = strlen(filename) - pos
:	let fileType = strpart(filename, pos, len) 
:	return fileType
:endfunction

:function! Run_test()
:   let tfile = 'tests/test_' . tolower(bufname('%'))
:   let tfile = substitute(tfile, '.lib', '', '')
:   if filereadable(tfile)
:       let result = system('php ' . tfile)
:       return result
:   else
:       return 'Test file does not exist, tried to run: ' . tfile
:endfunction

:function! Open_test()
:   let tfile = 'tests/test_' . tolower(bufname('%'))
:   let tfile = substitute(tfile, '.lib', '', '')
:   execute ':vsplit ' . tfile
:   redraw
:   if filereadable(tfile)
:       return 'echo "Opened test file: ' . tfile . '"'
:   else
:       return 'echo "Test file did not exist, created it"'
:endfunction

" Use default templates based on filename
let filetype = GetFileType()
let template = ''
let templateDir = '~/dotfiles/vim/templates/'
if filetype == '.php'
    let template = 'php'
elseif filetype == '.html'
    let template = 'xhtml_1_0_strict'
endif

" Use template to build file
if template != ''
    let template = templateDir . template
    if filereadable(template)
		au BufNewFile * execute ':0r ' . template

		" Remove last line if its empty
		if getline(line('$')) == ''
			au BufNewFile * execute ':' . line('$') . 'delete 1'
		endif

		" Insert author automatically
		let author = system('finger ' . $USER . ' | grep Name | sed s/.*Name:\ //')
		let len = strlen(author)
		let author = strpart(author,0,len-1)
        if author != ''
            au BufNewFile * silent! execute ':%s/<vi-tpl-author>/' . author . '/g'
        endif

		" Insert time automagicaly
		let time = strftime('%Y-%m-%d')
		au BufNewFile * silent! execute ':%s/<vi-tpl-time>/' . time . '/g'

        " Insert tab-settings automagically
        let tabsettings = system('cat ~/dotfiles/vim/templates/tabsettings')
        let tabsettings = substitute(tabsettings, '\n', '\r', 'g')
		au BufNewFile * silent! execute ':%s/<vi-tpl-tabsettings>\n/' . tabsettings . '/g'
	endif
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
set encoding=utf-8

" Set up the status line
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun

set laststatus=2
call <SID>SetStatusLine()

" blah..
iab teh the
