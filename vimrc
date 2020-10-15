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

" Folding help
Plug 'Konfekt/FastFold'
Plug 'kalekundert/vim-coiled-snake'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" close a buffer but not the window
Plug 'qpkorr/vim-bufkill'

" Surround!
Plug 'tpope/vim-surround'

"fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Plugin with lots of snippets
Plug 'honza/vim-snippets'

" UtilSnips
Plug 'SirVer/ultisnips'

" NERD Commenter
Plug 'preservim/nerdcommenter'

" Rainbow parentheses
Plug 'frazrepo/vim-rainbow'


" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Black
Plug 'psf/black', { 'branch': 'stable' } 

" Doc string generator
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install'}

" LaTeX plugin
Plug 'lervag/vimtex'

" Indents
Plug 'Vimjas/vim-python-pep8-indent'


call plug#end()


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


" Flag whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Colorscheme
colorscheme molokai
let g:molokai_original = 1
set background=dark

" Status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'molokai'
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

" Buffer finder help
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

" Enable global rainbow parentheses
let g:rainbow_active = 1


" Black configuration
" Run black on save
"autocmd BufWritePre *.py execute ':Black'

" Doc string generation format
let g:pydocstring_formatter = 'google'

" vimtex setting
let g:tex_flavor = 'latex'



" Coc.nvim settings from vimtex guy
let g:coc_global_extensions = [
        \ 'coc-vimtex',
        \ 'coc-omni',
        \ 'coc-snippets',
        \ 'coc-python',
        \ 'coc-json',
        \ 'coc-ultisnips',
        \]

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr><cr>    pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
inoremap <expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

imap <silent> <c-u>     <plug>(coc-snippets-expand)

nmap <silent> <leader>ld <plug>(coc-definition)zv
nmap <silent> <leader>lr <plug>(coc-references)
nmap <silent> <leader>lt <plug>(coc-type-definition)
nmap <silent> <leader>la <plug>(coc-implementation)
nmap <silent> <leader>la <plug>(coc-codeaction-selected)
xmap <silent> <leader>la <plug>(coc-codeaction-selected)

nmap <silent> <leader>lp <plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <plug>(coc-diagnostic-next)
nmap <silent> <leader>lk :<c-u>call CocAction('doHover')<cr>

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


" ultisnips auto complete with tab
let g:UltiSnipsExpandTrigger="<nop>"
"let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories = [('~/.vim/UltiSnips')]

nnoremap <leader>es :UltiSnipsEdit!<cr>

"Vimtex
let g:vimtex_fold_enabled = 1
