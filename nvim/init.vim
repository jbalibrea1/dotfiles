set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
syntax enable
set encoding=utf-8
set shell=fish
set cursorline
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/plugins-config.vim
so ~/.config/nvim/maps.vim

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
let g:gruvbox_contrast_dark= 'hard'
"let g:gruvbox_transparent_bg = 1 
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
filetype plugin indent on
set laststatus=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set path+=**
set wildignore+=*/node_modules/*
set noshowmode
set hlsearch
set incsearch 
set ignorecase
set smartcase
set smarttab
set expandtab
" Add asterisks in block comments
set formatoptions+=r
colorscheme gruvbox

set winblend=0
set wildoptions=pum
set pumblend=5
"set background=dark
" Use NeoSolarized
"let g:neosolarized_termtrans=1
"let g:neosolarized_contrast = "high"
"let g:neosolarized_visibility = "high"
"let g:neosolarized_vertSplitBgTrans = 1
"colorscheme NeoSolarized
