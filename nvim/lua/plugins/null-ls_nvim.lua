-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    null-ls.nvim
--   Github:    github.com/jose-elias-alvarez/null-ls.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local null_ls = require("null-ls")
require("mason-null-ls").setup({
	automatic_installation = true,
	automatic_setup = true,
	ensure_installed = { "stylua", "prettier", "rustfmt", "clang_format" },
})

-- local packages = require("mason-registry")

-- get all installed Packages
-- local installed_packages = packages.get_installed_package_names()

-- local formatting = null.builtins.formatting
-- local completion = null.builtins.completion
-- local diagnostics = null.builtins.diagnostics
-- local code_actions = null.builtins.code_actions

-- register any number of sources simultaneously
-- local sources = {}
-- local load = false

-- local api = vim.api
-- local fn = vim.fn

-- null.setup({})

require("mason-null-ls").setup_handlers({
	function(source_name, methods)
		-- hopefully this is the catch all

		require("mason-null-ls.automatic_setup")(source_name, methods)
	end,
	stylua = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.stylua)
	end,
})
null_ls.setup()
-- ───────────────────────────────────────────────── --
-- ─────────────────❰ FORMATTING ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

-- for _, package in pairs(installed_packages) do
-- 	-- Lua
-- 	if package == "luaformatter" then
-- 		load = true
-- 		sources[#sources+1] = formatting.lua_format.with({
-- 			command = "lua-format",
-- 			args = {
-- 				"--indent-width",
-- 				"1",
-- 				"--tab-width",
-- 				"4",
-- 				"--use-tab",
-- 				"--chop-down-table",
-- 				"--extra-sep-at-table-end",
-- 			},
-- 		})
-- 		goto loop_continue
-- 	end
-- 	if package == "stylua" then
-- 		load = true
-- 		sources[#sources+1] = formatting.stylua.with({
-- 			command = "stylua",
-- 			args = {
-- 				"--search-parent-directories",
-- 				"--stdin-filepath",
-- 				"$FILENAME",
-- 				"-",
-- 			},
-- 		})
-- 		goto loop_continue
-- 	end
-- 	-- Python
-- 	if package == "black" then
-- 		load = true
-- 		sources[#sources+1] = formatting.black.with({
-- 			command = "black",
-- 			args = {"--quiet", "--fast", "-"},
-- 		})
-- 		goto loop_continue
-- 	end
-- 	-- Django ("htmldjango")
-- 	if package == "djlint" then
-- 		load = true
-- 		sources[#sources + 1] = formatting.djlint.with({
-- 			command = "djlint",
-- 			args = {"--reformat", "-"},
-- 		})
-- 		goto loop_continue
-- 	end
-- 	-- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue",
-- 	-- "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql"
-- 	if package == "prettier" then
-- 		load = true
-- 		sources[#sources+1] = formatting.prettier.with({
-- 			command = "prettier",
-- 			args = {"--stdin-filepath", "$FILENAME"},
-- 		})
-- 		goto loop_continue
-- 	end
-- 	-- C, C++, CS, Java
-- 	if package ==  "clang-format" then
-- 		load = true
-- 		sources[#sources+1] = formatting.clang_format.with({
-- 			command = "clang-format",
-- 			args = {
-- 				"-assume-filename",
-- 				"$FILENAME",
-- 			},
-- 			to_stdin = true,
-- 		})
-- 		goto loop_continue
-- 	end
--
-- 	::loop_continue::
-- end
--
-- -- Rust
-- if fn.executable("rustfmt") == 1 then
-- 	load = true
-- 	sources[#sources + 1] = formatting.rustfmt.with({command = "rustfmt"})
-- end
-- -- Go
-- if fn.executable("gofmt") == 1 then
-- 	load = true
-- 	sources[#sources+1] = formatting.gofmt.with({})
-- end

-- ───────────────❰ end FORMATTING ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ CODEACTION ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions

--[===[
-- Javascript
if vim.fn.executable("clang-format") == 1 then
	load = true
	sources[#sources+1] = code_actions.eslint.with({
		command = "eslint",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
		args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
		to_stdin = true,
	})
end
---]===]

-- ───────────────❰ end CODEACTION ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ DIAGNOSTICS ❱───────────────── --
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- -- Django ("htmldjango")
-- if vim.fn.executable("djlint") == 1 then
-- 	load = true
-- 	sources[#sources+1] = diagnostics.djlint.with({
-- 		command = "djlint",
-- 		args = { "$FILENAME" },
-- 	})
-- end
-- ───────────────❰ end DIAGNOSTICS ❱─────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ COMPLETION ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
-- ───────────────❰ end COMPLETION ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ───────────────────❰ HOVER ❱───────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
-- ─────────────────❰ end HOVER ❱─────────────────── --
-- ───────────────────────────────────────────────── --

-- setup null-ls
-- if load then
-- 	null.setup({
-- 		sources = sources
-- 	})
-- end
local api = vim.api
-- give border to null-ls window
local group = api.nvim_create_augroup("AbstractNulllsAutoGroup", { clear = true })
api.nvim_create_autocmd("FileType", {
	pattern = "null-ls-info",
	group = group,
	callback = function()
		api.nvim_win_set_config(0, { border = "rounded" })
	end,
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
