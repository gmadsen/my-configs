
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-cmp
--   Github:    github.com/hrsh7th/nvim-cmp
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --



-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --


local import_cmp, cmp = pcall(require, 'cmp')
if not import_cmp then return end

local import_luasnip, luasnip = pcall(require, 'luasnip')
if not import_luasnip then return end

cmp.setup({
	snippet = {
		expand = function(args) luasnip.lsp_expand(args.body) end,
	},

	window = {
		documentation = {
			border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
		},
		completion = {
			border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			local import_lspkind, lspkind = pcall(require, "lspkind")
			if import_lspkind then
				vim_item.kind = lspkind.presets.default[vim_item.kind]
			end

			-- limit completion width
			local ELLIPSIS_CHAR = '…'
			local MAX_LABEL_WIDTH = 35
			local label = vim_item.abbr
			local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
			if truncated_label ~= label then
				vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
			end

			-- set a name for each source
			vim_item.menu = ({
				copilot = "[Pilot]",
				buffer = "[Buff]",
				nvim_lsp = "[LSP]",
				nvim_lsp_signature_help = "[Sig]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{name = 'nvim_lsp', keyword_length = 1},
		{name = 'nvim_lsp_signature_help' ,keyword_length = 1},
		{name = 'nvim_lua',keyword_length = 1},
		{name = 'path',keyword_length = 1},
		{name = 'luasnip',keyword_length = 1},
		{name = 'copilot',keyword_length = 1},
		{name = 'cmdline', keyword_length = 1},
		{name = 'buffer', keyword_length = 2},
		-- {name = 'calc'},
	},
	experimental = {
		-- ghost_text = true,
	},

})



-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
-- 	sources = cmp.config.sources({
-- 	  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
-- 	}, {
-- 	  { name = 'buffer' },
-- 	})
--   })

--   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline({ '/', '?' }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 	  { name = 'buffer' }
-- 	}
--   })

--   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline(':', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 	  { name = 'path' }
-- 	}, {
-- 	  { name = 'cmdline' }
-- 	})
--   })




-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --




-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- -- Require function for tab to work with LUA-SNIP
-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and
-- 	vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
-- 		:sub(col, col)
-- 		:match("%s") == nil
-- end

cmp.setup({
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping.complete({}),
		['<C-e>'] = cmp.mapping.close(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
				-- this will auto complete if our cursor in next to a word and we press tab
				-- elseif has_words_before() then
				--     cmp.complete()
			else
				fallback()
			end
		end, {"i", "s"}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),

	},
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

