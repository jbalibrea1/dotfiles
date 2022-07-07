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

colorscheme gruvbox
let g:gruvbox_contrast_dark = "dark"
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
set laststatus=2
set noshowmode
set hlsearch
set incsearch
set ignorecase
set smartcase
set smarttab

