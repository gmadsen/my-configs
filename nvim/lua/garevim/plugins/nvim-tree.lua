-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-tree.lua
--   Github:    github.com/kyazdani42/nvim-tree.lua
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
    "NvimTreeRefresh",
    "NvimTreeToggle",
    keys = "<leader>n",
  },
}

function M.config()
  -- auto switches dark and light background
  vim.cmd("autocmd ColorScheme * highlight highlight NvimTreeBg guibg=None")
  vim.cmd("autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg")

  require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    -- open_on_setup = false,
    -- ignore_ft_on_setup = {},
    -- auto_close = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = { enable = false, auto_open = false },
    diagnostics = {
      enable = true,
      icons = { hint = "", info = "", warning = "", error = "" },
    },
    git = { enable = true },
    update_focused_file = { enable = true, update_root = true, ignore_list = {} },
    system_open = { cmd = nil, args = {} },
    filters = { dotfiles = false, custom = {} },

    renderer = {
      indent_width = 1,
      indent_markers = {
        enable = false, -- show indent markers when folders are open
      },
      highlight_opened_files = "all",
      icons = {
        glyphs = {
          folder = {
            arrow_closed = " ",
          },
        },
      },
    },

    view = {
      width = { min = 30, padding = 0 },
      side = "left",
      signcolumn = "yes",
    },
  })
end

return M

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
