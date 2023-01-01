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
    event = "BufReadPre",
}
function M.config()
    local h = require("util.helpers")
    local ok, inline = h.safe_require("indent_blankline")
    if not ok then return end

    inline.setup({
        show_end_of_line = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
        show_trailing_blankline_indent = false,
        use_treesitter = true,
        -- char_list = { '|', '¦', '┆', '┊'},
        char = "┊",
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
