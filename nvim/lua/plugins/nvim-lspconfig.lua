-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-lspconfig
--   Github:    github.com/neovim/nvim-lspconfig
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --

local lsp = vim.lsp
local api = vim.api
local handlers = lsp.handlers
-- ───────────────────────────────────────────────── --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local options = { noremap = true, silent = true }

vim.keymap.set("n", "<Space><Space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
vim.keymap.set("n", "<Space><Space>q", "<cmd>lua vim.diagnostic.set_loclist({})<CR>", options)
vim.keymap.set("n", "<Space><Space>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
vim.keymap.set("n", "<Space><Space>b", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- ───────────────────────────────────────────────── --
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader><C-k>", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "<leader><space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader><space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)

	vim.keymap.set("n", "<leader><space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)


	vim.keymap.set("n", "<leader><space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader><space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader><space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)

	vim.keymap.set("n", "<leader><space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local function setup_lsp_config()
	-- options for lsp diagnostic
	-- ───────────────────────────────────────────────── --
	-- vim.diagnostic.config({
	-- 	float = {
	-- 		border = "rounded",
	-- 		focusable = true,
	-- 		style = "minimal",
	-- 		source = "always",
	-- 		header = "",
	-- 		prefix = "",
	-- 	},
	-- })
	--
	-- handlers["textDocument/publishDiagnostics"] =
	-- 				lsp.with(lsp.diagnostic.on_publish_diagnostics, {
	-- 					underline = true,
	-- 					signs = true,
	-- 					update_in_insert = true,
	-- 					virtual_text = {
	-- 						true,
	-- 						spacing = 6,
	-- 						-- severity_limit='Error'  -- Only show virtual text on error
	-- 					},
	-- 				})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		-- code_action_icon = signs.LightBulb,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
	-- handlers["textDocument/hover"] = lsp.with(handlers.hover, { border = "rounded" })
	-- handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, { border = "rounded" })

	-- show diagnostic on float window(like auto complete)
	-- vim.api.nvim_command [[ autocmd CursorHold  *.lua,*.sh,*.bash,*.dart,*.py,*.cpp,*.c,js lua vim.lsp.diagnostic.show_line_diagnostics() ]]

	-- set LSP diagnostic symbols/signs
	-- ─────────────────────────────────────────────────--
	-- api.nvim_command([[ sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl= ]])
	-- api.nvim_command([[ sign define DiagnosticSignWarn  text= texthl=DiagnosticSignWarn  linehl= numhl= ]])
	-- api.nvim_command([[ sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo  linehl= numhl= ]])
	-- api.nvim_command([[ sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint  linehl= numhl= ]])
	--
	-- api.nvim_command([[ hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#840000 ]])
	-- api.nvim_command([[ hi DiagnosticUnderlineHint cterm=underline  gui=underline guisp=#07454b ]])
	-- api.nvim_command([[ hi DiagnosticUnderlineWarn cterm=underline  gui=underline guisp=#2f2905 ]])
	-- api.nvim_command([[ hi DiagnosticUnderlineInfo cterm=underline  gui=underline guisp=#265478 ]])
	--
	-- Auto-format files prior to saving them
	-- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]

	--[[
	" to change colors, it's better to define in color scheme
	" highlight LspDiagnosticsUnderlineError         guifg=#EB4917 gui=undercurl
	" highlight LspDiagnosticsUnderlineWarning       guifg=#EBA217 gui=undercurl
	" highlight LspDiagnosticsUnderlineInformation   guifg=#17D6EB gui=undercurl
	" highlight LspDiagnosticsUnderlineHint          guifg=#17EB7A gui=undercurl
	--]]
end

-- ───────────────────────────────────────────────── --
-- setup LSPs
-- ───────────────────────────────────────────────── --
local function setup_lsp(mason_lspconfig)
	local tbl_deep_extend = vim.tbl_deep_extend
	local capabilities = lsp.protocol.make_client_capabilities()
	local lsp_options = {
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
		capabilities = capabilities,
	}

	local cmp_lsp = require("cmp_nvim_lsp")
	lsp_options.capabilities = (cmp_lsp).default_capabilities(capabilities)
	local rt_config = require("plugins.rust-tools")
	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup(lsp_options)
		end,

		["rust_analyzer"] = function()
			require("rust-tools").setup(tbl_deep_extend("force", lsp_options, rt_config))
		end,

		["sumneko_lua"] = function()
			require("lspconfig").sumneko_lua.setup(tbl_deep_extend("force", lsp_options, {
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the 'vim', 'use' global
							globals = { "vim", "use", "require" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = { enable = false },
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
					},
				},
			}))
		end,
	})
end

-- set up mason lsp config
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = { "sumneko_lua", "rust_analyzer" },
})

-- set up mason
local mason = require("mason")
local mconfig = require("plugins.mason_nvim")
mason.setup(mconfig.setup) -- setup mason

setup_lsp_config() -- setup lsp configs (mainly UI)
setup_lsp(mason_lspconfig) -- setup lsp (like pyright, ccls ...)

-- ───────────────────────────────────────────────── --
-- end LSP setup
-- ───────────────────────────────────────────────── --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
