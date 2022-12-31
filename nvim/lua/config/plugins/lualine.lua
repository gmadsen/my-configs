-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    lualine.nvim
--   Github:    github.com/nvim-lualine/lualine.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local M = {
    "nvim-lualine/lualine.nvim"
}

local function clock()
  return " " .. "os.date('%H:%M')"
end

function M.config()

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
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
      -- tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',},
    lualine_c = {'diagnostics'},
    lualine_x = {
        {'encoding'},
        {'fileformat'},
        { 'filetype', icon_only=true},
    },
    lualine_y = {require('auto-session-library').current_session_name, 'progress','location'},
    lualine_z = { "os.date('%b %d %Y %H:%M')", { clock, separator = { right = "" } }},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'nvim-tree'},
})

require('lualine').hide({
  place = {'tabline'}, -- The segment this change applies to.
  unhide = false,  -- whether to reenable lualine again/
})
end

return M
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
