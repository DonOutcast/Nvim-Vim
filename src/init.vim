
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
" let g:netrw_banner = 0 " hide banner above files
" let g:netrw_liststyle = 3 " tree instead of plain view
" let g:netrw_browse_split = 3 " open file in new tab

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
"if bufwinnr(1)
"	map + :resize +1<CR>
"	map - :resize -1<CR>
"	map < :vertical resize +1<CR>
"	map > :vertical resize -1<CR>
"endif

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

Plug 'tpope/vim-commentary'

" Class/module browser
Plug 'majutsushi/tagbar'      

" Icons
Plug 'ryanoasis/vim-devicons'  

" Project and file navigation
Plug 'preservim/nerdtree'

" File colors for NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'

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

autocmd BufRead,BufNewFile *.py :autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python %<CR>


"=====================================================
"" TagBar settings
"=====================================================
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 2

let g:tagbar_symbols = {
    \ 'class': 'c',
    \ 'enum': 'e',
    \ 'enumitem': 'i',
    \ 'field': 'f',
    \ 'function': 'F',
    \ 'interface': 'I',
    \ 'macro': 'm',
    \ 'member': 'M',
    \ 'method': 'M',
    \ 'namespace': 'n',
    \ 'struct': 's',
    \ 'template': 't',
    \ 'type': 'T',
    \ 'variable': 'v'
\ }


let g:tagbar_type_cpp = {
    \ 'kinds': [
        \ 'c:classes',
        \ 'd:macros',
        \ 'e:enumerations',
        \ 'f:functions',
        \ 'g:enums',
        \ 'l:local',
        \ 'm:members',
        \ 'n:namespaces',
        \ 'p:function_prototypes',
        \ 's:structs',
        \ 't:typedefs',
        \ 'u:unions',
        \ 'v:global_variables'
    \ ]
\ }

"=====================================================
"" DevIcon Settings
"=====================================================
" loading the plugin 
let g:webdevicons_enable = 1

" adding the flags to NERDTree 
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs 
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags 
let g:webdevicons_conceal_nerdtree_brackets = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0



" Enable file icons in netrw
let g:netrw_liststyle = 3
let g:netrw_list_hide = '^\..*'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_preview_maxheight = 30
let g:netrw_preview_maxwidth = 80
let g:netrw_list_hide .= '\|pycache__\|__init.py\|.*\~$'
let g:netrw_special_syntax_highlight = 1
let g:netrw_user_nerd_fonts = 1

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
nmap " :NERDTreeToggle<CR>

"=====================================================
"" NERDComment Settings 
"=====================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
