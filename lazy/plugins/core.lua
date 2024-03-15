if true then
  return {
    { "ellisonleao/gruvbox.nvim" },
    -- Configure LazyVim to load gruvbox
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },
  }
end
