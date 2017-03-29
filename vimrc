" colorscheme desert
syntax on
filetype plugin indent on
set cinoptions=g0

"let g:pathogen_disabled = []
"execute pathogen#infect()

set encoding=utf-8

" Tabs / Indentation
set autoindent
set expandtab
set shiftwidth=4
set smartindent
"set smarttab
set softtabstop=4
set tabstop=4

set number
set relativenumber

set hidden
set lazyredraw
set list listchars=tab:»·,trail:■
set nowrap
set ruler
set showmatch
set title
set ignorecase
set smartcase
"set autochdir

set path+=**
set wildmenu

" Remember Stuff
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo
                        " file -- 20 jump links, regs up to 500 lines'
set history=50

" F1 switches between .cpp and .h
map <F1> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" F2 Toggles relative numbers
noremap <F2> :set relativenumber!<CR>
" F3 Toggles highlighted search
noremap <F3> :set hlsearch! hlsearch?<CR>
" F4 inserts timestamp
nmap <F4> a<C-R>=strftime("%d-%m-%Y %I:%M %p")<CR><Esc>
imap <F4> <C-R>=strftime("%d-%m-%Y %I:%M %p")<CR>
" F5 make
nnoremap <F5> :wall <CR>:make -j8<CR>
set pastetoggle=<F11>

function GetScratch()
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction
nnoremap <F7> :call GetScratch()<CR>

set scrolloff=5

set colorcolumn=81
hi ColorColumn ctermbg=darkgrey

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

set tags=tags

cmap w!! w !sudo tee > /dev/null %

imap jj <Esc>
imap jk <Esc>
imap kj <Esc>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Disable f1 help
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Makefile likes tabs
autocmd FileType make setlocal noexpandtab
