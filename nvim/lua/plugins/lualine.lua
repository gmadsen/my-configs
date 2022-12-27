-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    lualine.nvim
--   Github:    github.com/nvim-lualine/lualine.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'nightfox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},

    },
    ignore_focus = {'nvimtree'},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',},
    lualine_c = {'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress','location'},
    lualine_z = { "os.date('%b %d %Y %H:%M')",},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'},
  winbar = {
--		lualine_y = {
			-- {
			-- 	require("noice").api.status.message.get_hl,
			-- 	cond = require("noice").api.status.message.has,
			-- },
			-- {
			-- 	require("noice").api.status.command.get,
			-- 	cond = require("noice").api.status.command.has,
			-- 	color = {fg = "#ff9e64"},
			-- },
			-- {
			-- 	require("noice").api.status.search.get,
			-- 	cond = require("noice").api.status.search.has,
			-- 	color = {fg = "#ff9e64"},
			-- },
--		},
--		lualine_y = {"tabs"},
--		lualine_z = {"windows"},
	},
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
