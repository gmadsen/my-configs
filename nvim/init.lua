--    Author:     Garrett Madsen
-- ───────────────────────────────────────────────── --
-- local debug = require("util.debug")
--
-- if vim.env.VIMCONFIG then
--   return debug.switch(vim.env.VIMCONFIG)
-- end

require("garevim.config.options")
require("garevim.config.lazy")
require("garevim.config.commands")
require("garevim.config.mappings")

-- require("util.dashboard").setup()

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
