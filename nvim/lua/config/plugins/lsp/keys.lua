local wk = require("which-key")

local M = {}

function M.setup(client, buffer)
  local map = vim.keymap.set
  local cap = client.server_capabilities
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local opts = {silent = true}


map("n", "<Space><Space>q", "<cmd>lua vim.diagnostic.set_loclist({})<CR>", options)

---------------------------- Line Diagnostics --------------------------------------
  --       d = { vim.diagnostic.open_float, "Line Diagnostics" },
map("n", "<Space><Space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", options)

map("n", "<Space>l", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<Space>L", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-------------------------- diagnostic movements -----------------------------------
-----------------------------------------------------------------------------------
-- ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next Error" },
-- ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev Error" },
-- ["[w"] = {
--   "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
--   "Next Warning",
-- },
-- ["]w"] = {
--   "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
--   "Prev Warning",

map("n", "<Space><Space>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
map("n", "<Space><Space>b", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
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


------------------------------------ Telescope -------------------------------------------------------
-- d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
-- d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
-- r = { "<cmd>Telescope lsp_references<cr>", "References" },
-- R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
-- D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
-- I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
-- t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
-- ────────────────────────────────────────────────────────────────────────────────────────────────────────── --


  map("n", "<leader><space>d", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
  map("n", "<Space>d", "<cmd>Lspsaga peek_definition<CR>")


  map("n", "<leader><space>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)

  map("n", "<leader><space>D", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)

  map("n", "<leader><space>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)

  ---------------------- hover --------------------------------
  map("n", "<leader><space>k", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
  map("n", "<Space>k", "<cmd>Lspsaga hover_doc<CR>")


  -------------------------- Sig Help ----------------------------
  map("n", "<leader><space><C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
  --   ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },


  ----------------------- LSP referneces --------------------------
  map("n", "<leader><space>r", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
  map("n", "<Space>r", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })


  ------------------------- LSP Workspaces ------------------------------------------------
  --         i = { "<cmd>LspInfo<cr>", "Lsp Info" },
  map("n", "<leader><space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", bufopts)
  map("n", "<leader><space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", bufopts)
  map("n", "<leader><space>wl", function()
    print(vim.inspect("vim.lsp.buf.list_workspace_folders()"))
  end, vim.tbl_deep_extend("force", bufopts, { desc = "list workspace folders" }))


  ------------------------- Code Actions --------------------------------------------------
  map("n", "<leader><space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
  map({ "n", "v" }, "<Space>a", "<cmd>Lspsaga code_action<CR>")


-------------------- Format ----------------------------
  map("n", "<Space>f", "<ESC>:lua vim.lsp.buf.format()<CR>")
  map("n", "<leader><space>f", function()
    vim.lsp.buf.format({ async = true })
  end, vim.tbl_deep_extend("force", bufopts, { desc = "format" }))

---------------------- Rename -----------------------------
map({"n", "v"}, "<Space>R", "<cmd>Lspsaga rename<cr>")
map("n", "<leader><space>R", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)


----------------   Outline -----------------------------------
map("n", "<Space>o", "<cmd>Lspsaga outline<CR>")

  -- Enable completion triggered by <c-x><c-o>
  --jvim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

end
return M
