
-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 🛑 Отключить eslint LSP
        eslint = {
          enabled = false,
        },
        vtsls = {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
              enableMoveToFileCodeAction = true,
            },
          },
        },
        tailwindcss = {},
        -- optionally keep cssmodules_ls if you need it
      },
    },
  },
}
