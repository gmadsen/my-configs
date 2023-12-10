-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    indent-blankline.nvim
--   Github:    github.com/lukas-reineke/indent-blankline.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
}
function M.config()
  local inline = require("indent_blankline")

  inline.setup({
    show_end_of_line = false,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    char = "▏",
    -- char_list = { '|', '¦', '┆', '┊'},
    -- char = "┊",
    filetype_exclude = {
      "help",
      "startify",
      "alpha",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "lsp-installer",
      "Trouble",
      "lazy",
    },
    buftype_exclude = {
      "terminal",
      "nofile",
    },
  })
end

return M

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
