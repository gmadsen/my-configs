-- Add any servers here together with their settings
---@type lspconfig.options
local servers = {
  ansiblels = {},
  bashls = {},
  clangd = {},
  cssls = {},
  dockerls = {},
  tsserver = {},
  svelte = {},
  eslint = {},
  html = {},
  marksman = {},
  pyright = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
  yamlls = {},
  lua_ls = {},
  vimls = {},
}
return servers
