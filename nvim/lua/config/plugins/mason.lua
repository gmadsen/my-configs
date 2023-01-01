local M = {
  "williamboman/mason.nvim",
  requires = {
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

  local h = require("util.helpers")
  local ok, mr = h.safe_require("mason-registry")
  if not ok then return end

  for _, tool in ipairs(M.tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

function M.config()
  local h = require("util.helpers")
  local ok, mason = h.safe_require("mason")
  if not ok then return end
  mason.setup()

  M.check()
  local con_ok, mlspconfig = h.safe_require("mason-lspconfig")
  if not con_ok then return end

  mlspconfig.setup({
    automatic_installation = true,
  })
end

return M
