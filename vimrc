" execute pathogen#infect()
packadd! dracula
packadd! gruvbox

syntax on
filetype plugin indent on
set foldmethod=syntax
set foldlevelstart=10
"colorscheme desert
"colorscheme dracula
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
set cinoptions=g0

"let g:pathogen_disabled = []
"execute pathogen#infect()

set encoding=utf-8

let mapleader=","

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

set backup
set backupdir=./.backup//,~/.backup//,.,/tmp//
set directory=./.backup//,~/.backup//,.,/tmp//

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
" F4 Taglist
nnoremap <silent> <F4> :TlistToggle<CR>
" F5 make
nnoremap <F5> :wall <CR>:make -j8<CR>
" F6 inserts timestamp
nmap <F6> a<C-R>=strftime("%F %R")<CR><Esc>
imap <F6> <C-R>=strftime("%F %R")<CR>
cmap <F6> <C-R>=strftime("%F %R")<CR>
" F7 Opens a scratch window
nnoremap <F7> :call GetScratch()<CR>

set pastetoggle=<F11>

function GetScratch()
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction

set scrolloff=5

set colorcolumn=81
hi ColorColumn ctermbg=darkgrey

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" netrw
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4

" taglist
"let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
" let Tlist_GainFocus_On_ToggleOpen = 1

set tags=tags;/

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
"inoremap <f1> <esc>
"nnoremap <f1> <esc>
"vnoremap <f1> <esc>

" Makefile likes tabs
autocmd FileType make setlocal noexpandtab
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
nnoremap <silent><buffer> <C-k> <Esc>:Cppman <cword><CR>


"highlight DiffAdd term=reverse cterm=bold ctermbg=22 ctermfg=white
"highlight DiffAdd term=bold cterm=reverse ctermfg=23 ctermbg=0
"highlight DiffChange term=reverse cterm=bold ctermbg=9 ctermfg=white
"highlight DiffText term=reverse cterm=bold ctermbg=8 ctermfg=white
"highlight DiffDelete term=reverse cterm=bold ctermbg=52 ctermfg=black
