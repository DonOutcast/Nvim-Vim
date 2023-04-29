" Disable vi compatibility
if !has("nvim")
	set nocompatible
endif

" Visual
set number
set nohls
set showcmd

" Indentig
set autoindent
set smartindent

" Better search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " open file in new tab

" Status line stuff
set laststatus=2
set statusline=%F%m%r%h%W\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Use mouse everywhere
set mouse=a

" Set the commands to save in history default number is 20.
set history=1000

" Highlight cursor line and cursor column
set cursorline
set nocursorcolumn

" Resize windows
if bufwinnr(1)
	map + :resize +1<CR>
	map - :resize -1<CR>
	map < :vertical resize +1<CR>
	map > :vertical resize -1<CR>
endif

set wildmenu

set encoding=utf-8
set noswapfile
set scrolloff=7


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

filetype indent on
call plug#begin()
" For search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" color schemas
Plug 'morhetz/gruvbox'  " colorscheme gruvbox
" Icons
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'jiangmiao/auto-pairs'
" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme gruvbox
" --- Statusbar ---
" Airline settings
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1

" Color scheme for airline
let g:airline#themes#dark#palette = {}
let g:airline#themes#dark#palette.normal = ['234', '52']
let g:airline#themes#dark#palette.insert = ['234', '110']
let g:airline#themes#dark#palette.visual = ['234', '130']
let g:airline#themes#dark#palette.replace = ['234', '166']
let g:airline#themes#dark#palette.command = ['234', '52']
let g:airline#themes#dark#palette.inactive = ['236', '236']
let g:airline#themes#dark#palette.accent = ['255', '253']

" Section display settings
let g:airline_section_a = airline#section#create(['%{strftime("%H:%M")}', ' %Y-%m-%d '])
let g:airline_section_c = airline#section#create(['%{&filetype}'])
let g:airline_section_x = airline#section#create(['%=%{mode()}'])

let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z                   = airline#section#create([
			\ '%1p%% ',
			\ 'Ξ%l%',
			\ '\⍿%c'])
call airline#parts#define_accent('mode', 'black')

command! -nargs=* Find :execute 'Telescope find_files grep_word='.shellescape(<q-args>)


