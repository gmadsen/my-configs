local M = {
    "catppuccin/nvim", --
    as = "catppuccin", --
}

M.config = function()
    require("catppuccin").setup({
        integrations = {
            cmp = true,
            dashboard = true,
            gitsigns = true,
            hop = true,
            illuminate = false,
            leap = false,
            lsp_saga = true,
            lsp_trouble = true,
            mason = true,
            neotree = true,
            noice = true,
            notify = true,
            nvimtree = true,
            semantic_tokens = false,
            symbols_outline = false,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
            ts_rainbow = true,
            which_key = true,

            -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
            dap = { enabled = false, enable_ui = false },
            indent_blankline = {
                enabled = false,
                colored_indent_levels = false,
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
        },
    })
end

return M
