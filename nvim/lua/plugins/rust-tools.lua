-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    rust-tools.nvim
--   Github:    github.com/simrat39/rust-tools.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local import_rt, rt = pcall(require, "rust-tools")
if not import_rt then return end

rt.setup {

	server = {
		settings = {
			on_attach = function(_, bufnr)
				-- Hover actions
				vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
			end,
			["rust-analyzer"] = {
				checkOnSave = {
					command = "rustfmt"
				},
			},
		},
	},
}
