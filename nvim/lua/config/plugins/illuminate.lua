
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:
--   Github:    github.com/RRethy/vim-illuminate
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local M = {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    after = {
        "nvim-treesitter"
    },
}

function M.setup()
local h = require("util.helpers")
local import_illuminate, illuminate = h.safe_require("illuminate")
if not import_illuminate then return end

illuminate.configure {
-- providers: provider used to get references in the buffer, ordered by priority
providers = {
    'lsp',
    'treesitter',
    'regex',
},
-- delay: delay in milliseconds
delay = 200,
-- filetype_overrides: filetype specific overrides.
-- The keys are strings to represent the filetype while the values are tables that
-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
filetype_overrides = {},
-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
filetypes_denylist = {
    'dirvish',
    'fugitive',
},
-- under_cursor: whether or not to illuminate under the cursor
under_cursor = true,
}
end
return M

