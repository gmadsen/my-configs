-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-bufferline.lua
--   Github:    github.com/akinsho/nvim-bufferline.lua
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- To view the active highlight groups run `:so $VIMRUNTIME/syntax/hitest.vim`
local M = {
  "akinsho/nvim-bufferline.lua",
  event = "BufAdd",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", "EastEden/nightfox.nvim" },
  },
}

function M.config()
  vim.cmd([[set termguicolors]])
  require("bufferline").setup({
    options = {
      themable = true,
      always_show_bufferline = true, -- don't show bufferline if there is only one file is opened

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
      separator_style = "thin", -- options "slant" | "thick" | "thin" | { 'any', 'any' },
      offsets = {
        {
          filetype = "NvimTree",
          text = "Tree",
          highlight = "Directory",
          text_align = "center",
          separator = false,
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
