
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

-- plugin config to improve start-up time.
-- it should be always on the top of init.lua file
require('plugins/impatient_nvim')   -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your


require('configs')                  -- plugin independent configs
require('mappings')                 -- plugin independent mappings

-- loading plugins and its configs are managed in seperate config file, ~/.config/nvim/lua/plugins/packer_nvim.lua
require('packer_nvim')


-- set colorscheme
pcall(vim.cmd,'colorscheme nightfox')

-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

