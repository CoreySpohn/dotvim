if true then
  return {
    -- add ruff_lsp to lspconfig
    {
      "neovim/nvim-lspconfig",
      ---@class PluginLspOpts
      opts = {
        ---@type lspconfig.options
        servers = {
          -- ruff_lsp will be automatically installed with mason and loaded with lspconfig
          ruff_lsp = {},
        },
      },
    },
  }
end
