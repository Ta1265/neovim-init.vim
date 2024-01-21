
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" paste without yanking
" vnoremap p "_dP " - causes the leading character to be deleted
vnoremap p "0p " " fixes character to be deleted 

vnoremap <leader>d "_d

" Highlight on yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
augroup END

set clipboard=unnamed "y and p to use system clipboard"
