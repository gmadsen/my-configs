
--    Author:     Garrett Madsen  , inspired by Ali Shahid
--    Github:     github.com/shaeinst


-- ───────────────────────────────────────────────── --
-- ────────────────❰ Leader Mapping ❱─────────────── --
-- mapping leader here. it will work for every mapped
-- require('util.debug')
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'
-- ───────────────────────────────────────────────── --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --
require('config.options')                  -- global options
require('config.commands')                 -- auto commands
require('config.mappings')                 -- key mappings

require('archive_plugins.impatient_nvim')   -- impatient needs to be setup before any other
require('packer_nvim')              -- loading plugins and plugin configs

vim.api.nvim_create_autocmd("User", {
  pattern = "PackerSync",
  callback = function()
    require("util").version()
    require("config.comands")
    require("config.mappings")
  end,
})
-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

