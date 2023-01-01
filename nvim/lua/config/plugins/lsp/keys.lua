local wk = require("which-key")

local M = {}

function M.setup(client, buffer)
  local cap = client.server_capabilities


local options = { noremap = true, silent = true }

vim.keymap.set("n", "<Space><Space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
vim.keymap.set("n", "<Space><Space>q", "<cmd>lua vim.diagnostic.set_loclist({})<CR>", options)
vim.keymap.set("n", "<Space><Space>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
vim.keymap.set("n", "<Space><Space>b", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- ───────────────────────────────────────────────── --
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<leader><space>d", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>D", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>k", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space><C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", bufopts)

  vim.keymap.set("n", "<leader><space>wl", function()
    print(vim.inspect("vim.lsp.buf.list_workspace_folders()"))
  end, vim.tbl_deep_extend("force", bufopts, { desc = "list workspace folders" }))

  vim.keymap.set("n", "<leader><space>R", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
  vim.keymap.set("n", "<leader><space>r", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)

  vim.keymap.set("n", "<leader><space>f", function()
    vim.lsp.buf.format({ async = true })
  end, vim.tbl_deep_extend("force", bufopts, { desc = "format" }))
end

---------------------- Rename
map({"n", "v"}, "<Space>R", "<cmd>Lspsaga rename<cr>")
map("n", "<Space>f", "<ESC>:lua vim.lsp.buf.format()<CR>")

---------------- LSP saga
map("n", "<Space>r", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
map({ "n", "v" }, "<Space>a", "<cmd>Lspsaga code_action<CR>")
map("n", "<Space>d", "<cmd>Lspsaga peek_definition<CR>")
map("n", "<Space>l", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<Space>L", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "<Space>o", "<cmd>Lspsaga outline<CR>")
map("n", "<Space>k", "<cmd>Lspsaga hover_doc<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- Only jump to error
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({
		severity = vim.diagnostic.severity.ERROR,
	})
end)
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({
		severity = vim.diagnostic.severity.ERROR,
	})
end)
--

end
return M




  -- local keymap = {
  --   buffer = buffer,
  --   ["<leader>"] = {
  --     c = {
  --       name = "+code",
  --       {
  --         cond = client.name == "tsserver",
  --         o = { "<cmd>:TypescriptOrganizeImports<CR>", "Organize Imports" },
  --         R = { "<cmd>:TypescriptRenameFile<CR>", "Rename File" },
  --       },
  --       r = {
  --         function()
  --           require("inc_rename")
  --           return ":IncRename " .. vim.fn.expand("<cword>")
  --         end,
  --         "Rename",
  --         cond = cap.renameProvider,
  --         expr = true,
  --       },
  --       a = {
  --         { vim.lsp.buf.code_action, "Code Action" },
  --         { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
  --       },
  --       f = {
  --         {
  --           require("config.plugins.lsp.formatting").format,
  --           "Format Document",
  --           cond = cap.documentFormatting,
  --         },
  --         {
  --           require("config.plugins.lsp.formatting").format,
  --           "Format Range",
  --           cond = cap.documentRangeFormatting,
  --           mode = "v",
  --         },
  --       },
  --       d = { vim.diagnostic.open_float, "Line Diagnostics" },
  --       l = {
  --         name = "+lsp",
  --         i = { "<cmd>LspInfo<cr>", "Lsp Info" },
  --         a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
  --         r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
  --         l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
  --       },
  --     },
  --     x = {
  --       d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
  --     },
  --   },
  --   g = {
  --     name = "+goto",
  --     d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
  --     r = { "<cmd>Telescope lsp_references<cr>", "References" },
  --     R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
  --     D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
  --     I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
  --     t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
  --   },
  --   ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
  --   ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  --   ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
  --   ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
  --   ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next Error" },
  --   ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev Error" },
  --   ["[w"] = {
  --     "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
  --     "Next Warning",
  --   },
  --   ["]w"] = {
  --     "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
  --     "Prev Warning",
  --   },
  -- }
  --
  -- wk.register(keymap)
  -- end

  -- return M
