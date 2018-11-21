" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/endel/vim-github-colorscheme.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'tpope/vim-commentary'
Plug 'moll/vim-bbye'
Plug 'StanAngeloff/php.vim'
Plug 'ncm2/ncm2'
"Plug 'tomtom/tcomment_vim'

" Initialize plugin system
call plug#end()

" ColorSchemes, Colors, Fonts and whatever ...
" ===========================================================================>
"colorscheme redhat
set guioptions+=e
"
set guifont=Consolas:h14

set linespace=5
highlight clear VertSplit
highlight VertSplit guifg=Darkred guibg=White

"Line number
highlight LineNr guifg=#cccccc guibg=#f4f4f4
"ColumnColor
highlight ColorColumn guibg=LightRed
"let &colorcolumn="80,".join(range(120,999),",")


" Cursor on GUI
"highlight Cursor guifg=white guibg=Red
highlight iCursor guifg=white guibg=#ff0000

" Tab bar
highlight TabLineFill ctermfg=white ctermbg=black
highlight TabLine ctermfg=gray ctermbg=white
highlight TabLineSel ctermfg=white ctermbg=DarkRed
highlight Title guifg=red ctermfg=DarkRed ctermbg=none

"  "set guicursor=n-v-c:block-Cursor
"  "set guicursor+=i:ver100-iCursor
"  "set guicursor+=n-v-c:blinkon0
"  "set guicursor+=i:blinkwait10
"endif

" Vim configs
" ===========================================================================>
"set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set showcmd " show incomplete commands
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set cmdheight=1 " command bar height
filetype plugin indent on
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set fillchars+=vert:\|
set ruler
set magic
" set vim/nvim to do backup files
" set backup
" set backupdir=C:\WINDOWS\Temp
" set backupskip=C:\WINDOWS\Temp\*
" set directory=C:\WINDOWS\Temp
" set writebackup
" set vim/nvim not to do a backup file
set nobackup
set nowritebackup

" Line Numbers and Cursor
" ===========================================================================>
set wrap
set linespace=1
set number " show line numbers
set numberwidth=5
set relativenumber
  "set norelativenumber
set cursorline
set colorcolumn=81,121 "red line and over is error

" Folding
" ===========================================================================>
"set foldenable
"set nofoldenable
"set foldmethod=indent
"set foldlevel=1

" Searching
" ===========================================================================>
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

set expandtab
set nocompatible
set tabstop=2
set shiftwidth=2

" Toggle invisible characters
" ===========================================================================>
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪

" NerdTree
" ===========================================================================>
" autocmd vimenter * NERDTree
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 20
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMapOpenInTab='\r'
let g:NERDTreeQuitOnOpen=1 " close NERDTree after a file is opened
let NERDTreeShowHidden=1 " show hidden files in NERDTree
let NERDTreeIgnore = ['\.js.map$']" remove some files by extension

" NERDTree maps
map <C-n> :NERDTreeToggle<CR>
"nmap <silent> <leader>k :NERDTreeToggle<cr>
"nmap <silent> <leader>y :NERDTreeFind<cr>
"let g:nerdtree_tabs_open_on_gui_startup = 1

" ControlP
" ===========================================================================>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

nmap <leader>l :set list!<CR>

" Airline
" ===========================================================================>
" tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 0 "trailing spaces
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_c = airline#section#create(['%f'])
  " let g:airline_section_d = airline#section#create([])
  " let g:airline_section_e = airline#section#create([])
  " let g:airline_section_f = airline#section#create([])
  " let g:airline_section_g = airline#section#create([])
  " let g:airline_section_h = airline#section#create([])
  let g:airline_section_x = airline#section#create([])
  let g:airline_section_y= airline#section#create(['%p%%'])
  let g:airline_section_z = airline#section#create_right(['l:%l c:%c'])
endfunction
autocmd VimEnter * call AirlineInit()

"let g:airline_powerline_fonts=1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

let g:airline_theme = 'redhat'

" Buffers & Tabs
" ===========================================================================>
" https://github.com/jdavis/dotfiles/blob/master/.vimrc
" set hidden
"noremap <c-right> :bnext<CR>
"noremap <c-left> :bprevious<CR>

" Next and Prev Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Next and Prev Tabs
noremap <c-right> :tabnext<CR>
noremap <c-left> :tabprev<CR>
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

" Enforce Purity
" Disable arrow keys
" ===========================================================================>
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" easy split navigations
" ===========================================================================>
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map :W to :w
" ===========================================================================>
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" map “save” to ctrl-s
" ===========================================================================>
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

