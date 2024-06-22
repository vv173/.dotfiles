" Enable syntax highlighting
syntax enable

" Add line numbers
set number ruler

" Highlight the line currently under cursor
set cursorline

"Set the window's title, reflecting the file currently being edited
set title

" Enable automatic indentation
set autoindent smartindent

" Enable filetype detection, plugins, and indentation rules based on the detected file type
filetype plugin indent on

" YAML configuration
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Display a confirmation dialog when closing an unsaved file
set confirm

"Disable swap files
set noswapfile

" Enable spellchecking
set spell

