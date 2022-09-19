set nocompatible              " required
filetype off                  " required

" Add the vim-plug stuff
call plug#begin('~/.vim/plugged')

" Default settings
Plug 'tpope/vim-sensible'

" git integration
Plug 'tpope/vim-fugitive'

" Vim colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'

" Folding help
"Plug 'Konfekt/FastFold'
"Plug 'kalekundert/vim-coiled-snake'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" close a buffer but not the window
Plug 'qpkorr/vim-bufkill'

" Surround!
Plug 'tpope/vim-surround'

"fzf
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-frecency.nvim'

"
"Plugin with lots of snippets
Plug 'honza/vim-snippets'

" UtilSnips
Plug 'SirVer/ultisnips'

" NERD Commenter
Plug 'preservim/nerdcommenter'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LaTeX plugin
Plug 'lervag/vimtex'

" Indents
Plug 'Vimjas/vim-python-pep8-indent'

" Tree-sitter syntax highlighting
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

Plug 'jlanzarotta/bufexplorer'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'  " required
    Plug 'hrsh7th/nvim-cmp'       " optional, for completion
    Plug 'godlygeek/tabular'      " optional, needed for 'preservim/vim-markdown'
    Plug 'preservim/vim-markdown' " optional, recommended for syntax highlighting, folding, etc if you're not using nvim-treesitter
    Plug 'epwalsh/obsidian.nvim'
endif

call plug#end()

" Folding stuff
"set foldlevelstart=0
"set foldcolumn=0
"set foldtext=personal#fold#foldtext()

" Numbers
set number
set relativenumber
" Basic stuff
set showmatch
set showcmd
set incsearch
set mouse=a
" Makes it so that there's always 2 lines above and below the cursor
set scrolloff=2

" Indentation
set softtabstop=4
set shiftwidth=4
set expandtab
set copyindent
set preserveindent
silent! set breakindent

" Spelling command
nnoremap <C-s> :set spell spelllang=en_us<CR>
autocmd FileType text setlocal spell spelllang=en_us
autocmd FileType tex setlocal spell spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"set spell spelllang = en_us

" FZF fuzzy finder
"nnoremap <leader>s :<C-u>FZF~<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Git integration
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

" Flag whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Colorscheme
set termguicolors
"colorscheme molokai
"colorscheme nord
colorscheme gruvbox
"let g:molokai_original = 1
"set background=dark

" Status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16_gruvbox_dark_medium'
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.txt set textwidth=100
au BufRead,BufNewFile *.tex set textwidth=100
au BufRead,BufNewFile *.md set textwidth=100

" Buffer finder help
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

" Enable global rainbow parentheses
let g:rainbow_active = 1
" Fix rainbow parentheses conflict with spell check in txt files
let g:rainbow_conf = {
\	'separately': {
\		'*': {},
\		'text': {
\			'parentheses_options': 'contains=@NoSpell',
\		},
\	},
\}
autocmd FileType text let g:rainbow_active = 0

" Black configuration
" Run black on save
"autocmd BufWritePre *.py execute ':Black'

" Doc string generation format
let g:pydocstring_formatter = 'google'

" vimtex setting
let g:tex_flavor = 'latex'
"let g:vimtex_view_general_viewer='zathura'
let g:vimtex_view_method='zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \ 'options' : [
            \   '-verbose',
            \   '-shell-escape',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
"let g:vimtex_compiler_latexmk_engines = {
            "\ 'pdflatex' : '-pdf',
            "\}
let g:vimtex_fold_enabled = 1
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" ALE settings
let g:ale_linters = {
            \'python': ['pylint'],
            \'tex': ['lacheck', 'chktex']}

" Coc.nvim settings
let g:coc_global_extensions = [
        \ 'coc-vimtex',
        \ 'coc-omni',
        \ 'coc-snippets',
        \ 'coc-python',
        \ 'coc-pyright',
        \ 'coc-json',
        \ 'coc-ultisnips',
        \]

" Jump to error with coc
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev-error)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next-error)
nmap <silent> <A-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-j> <Plug>(coc-diagnostic-next)


nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
        if index(['vim', 'help'], &filetype) >= 0
                execute 'help ' . expand('<cword>')
        elseif &filetype ==# 'tex'
                VimtexDocPackage
        else
                call CocAction('doHover')
        endif
endfunction

if exists('*CocActionAsync')
        augroup coc_settings
                autocmd!
                autocmd CursorHold * silent call CocActionAsync('highlight')
        augroup END
endif
"imap <silent> <c-u>     <plug>(coc-snippets-expand)


" ultisnips auto complete with tab, jump forward with tab, move down with
" <c-j>, move up with <c-k>
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Expand with <c-u> and <c-y>, jump with <c-j> and <c-k>, move with tabs
"let g:UltiSnipsExpandTrigger="<nop>"
"let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories = [('~/.vim/UltiSnips')]
"let g:UltiSnipsSnippetDirectories = [('~/.vim/UltiSnips')]

"nnoremap <leader>es :UltiSnipsEdit!<cr>

" plugin: FastFold
"let g:fastfold_savehook=1
"let g:fastfold_fold_command_suffixes = ['x', 'X', 'M', 'R']
"let g:fastfold_fold_movement_commands = []

"" plugin: vim-coiled-snake
"let g:coiled_snake_foldtext_flags = []

" neovim stuff
if has('nvim')
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endif
