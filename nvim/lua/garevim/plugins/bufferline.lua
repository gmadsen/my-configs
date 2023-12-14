-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-bufferline.lua
--   Github:    github.com/akinsho/nvim-bufferline.lua
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local M = {
  "akinsho/nvim-bufferline.lua",
  event = "BufAdd",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
}

function M.config()
  require("bufferline").setup({
    options = {
      -- mode = "buffers", -- set to "tabs" to only show tabpages instead
      -- numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
      always_show_bufferline = true, -- don't show bufferline if there is only one file is opened

      -- close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      -- right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      -- left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      -- middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator = {
        icon = "▎", -- this should be omitted if indicator style is not 'icon'
        style = "icon", -- 'icon' | 'underline' | 'none',
      },

      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",

      max_name_length = 18,
      max_prefix_length = 18, -- prefix used when a buffer is de-duplicate
      tab_size = 22,
      diagnostics = "nvim_lsp", -- | "coc",
      diagnostics_update_in_insert = false,

      color_icons = true,
      show_close_icon = true,
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = false,
      -- separator_style = "thick", -- options "slant" | "thick" | "thin" | { 'any', 'any' },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
          separator = true,
        },
      },
    },
  })
end

return M

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
