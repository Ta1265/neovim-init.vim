
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
vnoremap p "_dP
vnoremap <leader>d "_d
nnoremap gd gdzz

" Highlight on yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=700 }
augroup END

set clipboard=unnamed "y and p to use system clipboard"
