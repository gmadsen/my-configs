-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-bufferline.lua
--   Github:    github.com/akinsho/nvim-bufferline.lua
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- safely import bufferline
local bufferline_imported, bufferline = pcall(require, "bufferline")
if not bufferline_imported then
	return
end

bufferline.setup({

	options = {

		mode = "buffers", -- set to "tabs" to only show tabpages instead
		numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
		always_show_bufferline = true, -- don't show bufferline if there is only one file is opened

		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon", -- 'icon' | 'underline' | 'none',
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",

		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,

		max_name_length = 22,
		max_prefix_length = 18, -- prefix used when a buffer is de-duplicate
		tab_size = 16,
		diagnostics = "nvim_lsp", -- | "coc",
		diagnostics_update_in_insert = false,

		color_icons = true,
		show_close_icon = false,
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_tab_indicators = false,
		enforce_regular_tabs = false, -- if set true, tabs will be prevented from extending beyond the tab size and all tabs will be the same length
		separator_style = "padded_slant", -- options "slant" | "thick" | "thin" | { 'any', 'any' },

		view = "multiwindow",
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		offsets = {
			{
				filetype = "NvimTree",
				text = "Tree",
				highlight = "Directory",
				text_align = "center",
				separator = true,
			},
		}
	},

 	--highlights = {
	--	buffer_selected = {
	--		italic = false
	--	},
	--	indicator_selected = {
	--		fg = {attribute = 'fg', highlight = 'Function'},
	--		italic = false
	--	}
	--}
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
