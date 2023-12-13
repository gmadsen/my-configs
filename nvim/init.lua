--    Author:     Garrett Madsen
-- ───────────────────────────────────────────────── --

require("garevim.config.options")
require("garevim.config.lazy")
require("garevim.config.commands")
require("garevim.config.mappings")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("garevim.util").version()
    require("garevim.config.commands")
    require("garevim.config.mappings")
  end,
})
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
