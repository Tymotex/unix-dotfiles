" =============================================================================
"                                   Basics
" =============================================================================
syntax on
set number
filetype plugin indent on

set paste

" Toggle relative line numbers in insert mode.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" =============================================================================
"                                    Remaps
" =============================================================================
" Yank to the Linux system clipboard with capital Y in visual mode.
set clipboard=unnamedplus
vnoremap Y "+y

" =============================================================================
"                                    Fixes
" =============================================================================
" For the cursor switching between normal and insert mode.
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'" 

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Prevent delay after sending an 'O' after ESC. "
set noesckeys

" =============================================================================
"                                    Themes
" =============================================================================
colorscheme onedark
set colorcolumn=80


