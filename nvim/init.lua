
--    Author:     Garrett Madsen  , inspired by Ali Shahid
--    Github:     github.com/shaeinst


-- ───────────────────────────────────────────────── --
-- ────────────────❰ Leader Mapping ❱─────────────── --
-- mapping leader here. it will work for every mapped

vim.g.mapleader = ';'
vim.g.maplocalleader = '|'
-- ───────────────────────────────────────────────── --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

require('plugins/impatient_nvim')   -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your


require('configs')                  -- plugin independent configs
require('mappings')                 -- plugin independent mappings

require('packer_nvim')              -- loading plugins and plugin configs


require('nightfox').load()          -- set colorscheme
-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

