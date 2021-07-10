" vim-plug https://github.com/junegunn/vim-plug
" commands
" :PlugInstall
" :PlugClean

" Start regular vim config stuff


filetype plugin indent on "built in pluggin to display tree


:command T 30vs . "my shortcut to Display a tree of working directory

set backspace=indent,eol,start

syntax on

set path=.,** "for :find file, set path= current directory, and all its child directories

set hlsearch incsearch "highlight term incrementally as you type it, use :nohl to remove highlight after 

colorscheme koehler " colors

set bg=dark "dark background

set shiftwidth=2 tabstop=2 softtabstop=4 expandtab autoindent smartindent "set tabs to 2 spaces

set noswapfile "no swap files (dont use virtual memory)

set hidden "Allow switching buffers without saving first (prevent no write sincle last change warning)

let g:netrw_banner=0 "No header spam in directory mode

let g:netrw_liststyle=3 " Shows files in a tree easier to navigate

":set shell=/usr/bin/bash

:set number "relative numbers

"set clipboard=unnamed "y and p to use system clipboard

nnoremap <C-Tab> :bn<CR>

"set nocursorline

" neovim/vimplug start here

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin()
Plug 'sainnhe/edge' "theme
Plug 'https://github.com/sheerun/vim-polyglot.git' " syntax highlighting for multiple languages
"Plug 'panglos/vim-javascript', { 'branch': 'main' } " syntax highlighting for javascript
"Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'yuezk/vim-js' " these two plugins will add highlighting and indenting to JSX and TSX files. 
Plug 'HerringtonDarkholme/yats.vim'
Plug 'nvim-lua/popup.nvim' "Telescope plugins (3)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  "autocorrect for js / ts
call plug#end()

if has('termguicolors') " theme helper
  set termguicolors
endif

let g:edge_transparent_background = 1
let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme edge

highlight lineNr ctermfg=grey
set smarttab
set cindent


" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-json' ]

highlight CocHighlightText     ctermfg=LightMagenta guifg=LightMagenta

let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

nmap <leader>y :StripWhitespace<CR>

set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Use gi go show documentation in preview window
" nnoremap <silent> gi :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

command! -nargs=0 Format :call CocAction('format')  " Use `:Format` to format current buffer




set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}  " Add status line support, for integration with other plugin, checkout `:h coc-status`

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }

}


