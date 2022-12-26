-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    rust-tools.nvim
--   Github:    github.com/simrat39/rust-tools.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local rt = require("rust-tools")

rt.setup({

	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions,
			               {buffer = bufnr})
			-- Code action groups
			vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group,
			               {buffer = bufnr})
		end,
	},
})
