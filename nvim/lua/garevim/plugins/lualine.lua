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
  "nvim-lualine/lualine.nvim",
  dependencies = { "SmiteshP/nvim-navic", "EdenEast/nightfox.nvim" },
  event = "VeryLazy",
}

function M.config()
  local function clock()
    return " " .. "os.date('%H:%M')"
  end

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "nightfox",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "alpha", "lazy" },
        winbar = {},
      },
      ignore_focus = { "nvimtree" },
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        -- tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "diagnostics" },
      lualine_x = {
        { "encoding" },
        { "fileformat" },
        { "filetype", icon_only = true },
      },
      lualine_y = {
        { "filename", path = 1 },
        { "progress" },
        { "location" },
      },
      lualine_z = {
        { "os.date('%b %d %Y %H:%M')" },
        { clock(), separator = { right = "" } },
      },
    },
    extensions = { "nvim-tree" },
  })

  require("lualine").hide({
    place = { "tabline" }, -- The segment this change applies to.
    unhide = false, -- whether to reenable lualine again/
  })
end

return M
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
