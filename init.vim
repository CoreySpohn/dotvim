set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc


lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    ensure_installed = {"markdown", "markdown_inline", "python", "json", "php"},
    highlight = { 
        enable = true,
        additional_vim_regex_highlighting = { "markdown" }
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require("obsidian").setup({
  dir = "~/my-vault",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})
EOF
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
