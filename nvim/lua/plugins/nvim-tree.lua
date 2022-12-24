
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-tree.lua
--   Github:    github.com/kyazdani42/nvim-tree.lua
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local import_ntree, nvim_tree = pcall(require, "nvim-tree")
if not import_ntree then return end


local cmd = vim.cmd -- execute Vim commands
cmd('autocmd ColorScheme * highlight highlight NvimTreeBg guibg=None')
cmd('autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg')


nvim_tree.setup {
	disable_netrw = false,
	hijack_netrw = false,
	open_on_setup = true,
	ignore_ft_on_setup = {},
	-- auto_close = false,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	hijack_directories = {enable = true, auto_open = true},
	diagnostics = {
		enable = true,
		icons = {hint = "", info = "", warning = "", error = ""},
	},
	git = {enable = true},
	update_focused_file = {enable = true, update_root = true, ignore_list = {}},
	system_open = {cmd = nil, args = {}},
	filters = {dotfiles = false, custom = {}},

	renderer = {
		indent_width = 1,
		indent_markers = {
			enable = false, -- show indent markers when folders are open
		},
		highlight_opened_files = "all", -- Highlight icons and/or names for opened files. Value can be `"none"`, `"icon"`, `"name"` or `"all"`.
	},

	view = {
		width = 25,
		side = 'left',
		signcolumn = "yes",
		hide_root_folder = true,
	}
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
