
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
require('options')
require('utilities')                -- utilities
require('mappings')                 -- key mappings

require('config.commands')          --  autocommands
-- require('plugins.impatient_nvim')   -- impatient needs to be setup before any other
require('packer_nvim')              -- loading plugins and plugin configs

-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

