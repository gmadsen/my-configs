-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-cmp
--   Github:    github.com/hrsh7th/nvim-cmp
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
vim.g.completeopt = "menu,menuone,noselect"
cmp.setup({

	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},


	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 35,
			ellipsis_char = "...",
			menu = {
				nvim_lsp = "[LSP]     ",
				nvim_lua = "[Lua]     ",
				copilot = "[Pilot]   ",
				luasnip = "[LuaSnip] ",
				buffer = "[Buff]    ",
				path = "[Path]    ",
				cmdline = "[Cmd]     ",
			},
		}),
	},
	sources = {
			{ name = "nvim_lua", keyword_length = 1 },
            { name = "nvim_lsp", keyword_length = 1 },
			{ name = "copilot", keyword_length = 1 },
			{ name = "luasnip", keyword_length = 1 },
			{ name = "nvim_lsp_signature_help", keyword_length = 1 },
			{ name = "buffer", keyword_length = 3 },
			{ name = "path", keyword_length = 1 },
			{ name = "cmdline" },
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path", keyword_length = 1 },
		{ name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
	},
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- -- blocks cmp when there is nothing to the left of cursor
-- vim.api.nvim_create_autocmd(
--   {"TextChangedI", "TextChangedP"},
--   {
--     callback = function()
--       local line = vim.api.nvim_get_current_line()
--       local cursor = vim.api.nvim_win_get_cursor(0)[2]
--
--       local current = string.sub(line, cursor, cursor + 1)
--       if current == "." or current == "," or current == " " then
--         require('cmp').close()
--       end
--
--       local before_line = string.sub(line, 1, cursor + 1)
--       local after_line = string.sub(line, cursor + 1, -1)
--       if not string.match(before_line, '^%s+$') then
--         if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
--           require('cmp').complete()
--         end
--       end
--   end,
--   pattern = "*"
-- })
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- local  has_words_before = function()
-- 	unpack = unpack or table.unpack
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
	mapping = {
		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end),
	},
})

cmp.setup({
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.close(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({select = true}),
	},
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
