set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc


lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    ensure_installed = {"markdown", "python", "json", "php"},
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
EOF
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
