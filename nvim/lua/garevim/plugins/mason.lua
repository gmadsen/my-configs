local M = {
  "williamboman/mason.nvim",
  dependencies = {
      "williamboman/mason-lspconfig.nvim",

  }
}

M.tools = {
  "prettierd",
  "stylua",
  "selene",
  "luacheck",
  "eslint_d",
  "shellcheck",
  "deno",
  "shfmt",
  "black",
  "isort",
  "flake8",
}

function M.check()

  local mr = require("mason-registry")

  for _, tool in ipairs(M.tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

function M.config()
  local mason = require("mason")
  mason.setup()

  M.check()
 local  mlspconfig = require("mason-lspconfig")

  mlspconfig.setup({
    automatic_installation = true,
  })
end

return M
