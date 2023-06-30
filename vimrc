lua require('plugins')
let g:python3_host_prog='~/miniconda3/bin/python3'
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected file type.
if has("autocmd")
  filetype plugin indent on
endif

filetype plugin on
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set autoread            " Automatically reload files when externally changed
set spell               " Spell checking per default
set nowrap              " Disable line wrapping (with unimpaired use yow to toggle)
set cursorline          " Highlight the current line
set termguicolors
" Color scheme
" The palenight color scheme comes from a plugin which might not be installed.
" In this case, vim startup should not fail.
silent! colorscheme gruvbox

" Auto-pairs
let g:AutoPairsFlyMode = 0  " Deactivate Fly mode (default)

" Jedi
if has("nvim")
    let g:jedi#completions_enabled = 0
endif

" Deoplete

" Surround
let b:surround_indent = 1

" Scroll down with supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Close NERDTree when it is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Ignore temporary files in NERDTree
let NERDTreeIgnore=['\.pyc', '__pycache__', '\.git', '\.eggs', '\.egg-info', '_cache', '\.swp', '\.tox']

" Configure numpy formatting for docstrings
let g:pydocstring_formatter = 'numpy'
nmap <silent> <leader>ds <Plug>(pydocstring)

" ALE config
let g:ale_fixers = {
      \ 'python': ['nayvy#ale_fixer', 'black', 'isort'],
      \ }
augroup python_format
    autocmd!
    autocmd BufWritePost *.py silent !black %
augroup end

"let g:semshi#excluded_hl_groups = []
"" Apply black on save
autocmd BufWritePost *.py silent !black %

" DVC
autocmd! BufNewFile,BufRead Dvcfile,*.dvc,dvc.lock setfiletype yaml

" Key mappings
let mapleader = " "

" Save and quit quickly
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :x<CR>
nnoremap <leader>x :xa<CR>

" Navigation between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>

" Navigation between tabs
nnoremap <C-f> :tabnext<CR>
nnoremap <C-d> :tabprevious<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggleVCS<CR>


" Fugitive
nnoremap gs :wa<CR> :vertical Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gb :Git blame<CR>

" Goto's
nnoremap gn :Semshi goto name next<CR>zOzz
nnoremap gN :Semshi goto name prev<CR>zOzz
nnoremap gf :Semshi goto function next<CR>zOzt
nnoremap gF k:Semshi goto function prev<CR>zOzt
nnoremap gc :Semshi goto class next<CR>zOzt
nnoremap gC k:Semshi goto class prev<CR>zOzt

" Python Tags
nnoremap <leader>b :TagbarToggle<CR>

" Got to next and previous linting error
nnoremap <silent>]w :ALENext<CR>zOzz
nnoremap <silent>[w :ALEPrevious<CR>zOzz

" Pytest
nnoremap <leader>tt :Pytest project<CR>
nnoremap <leader>tv :Pytest project verbose<CR>
nnoremap <leader>tf :Pytest file verbose<CR>
nnoremap <leader>tll :Pytest function<CR>
nnoremap <leader>tlv :Pytest function verbose<CR>

" Coverage
nnoremap <leader>cs :Coveragepy show<CR>
nnoremap <leader>cr :Coveragepy session<CR>


"activate mouse support
set mouse=nv

set number
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"let g:DiffUnit="Word"
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
nmap do :DiffviewOpen<CR>
nmap dc :DiffviewClose<CR>
