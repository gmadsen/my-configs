-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ─────────────────────────────────────────────────--
--      Plugin: nvim-autopairs
--      Github: github.com/windwp/nvim-autopairs
-- ─────────────────────────────────────────────────--
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Configs ❱━━━━━━━━━━━━━━━━━━━ --

-- safely import nvim-autopairs

local M = {
    "windwp/nvim-autopairs" ,
    require = "hrsh7th/nvim-cmp",
  }

function M.setup()
local h = require("util.helpers")
local valid, autopairs = h.safe_require("nvim-autopairs")
if not valid then return end

autopairs.setup({
	enable_check_bracket_line = false, -- Don't add pairs if it already have a close pairs in same line
	disable_filetype = { "TelescopePrompt", "vim" }, --
	enable_afterquote = false, -- add bracket pairs after quote
	enable_moveright = true,
	check_ts = false,
})

-- this is nvim-cmp Plugin dependent setting
-- If you want insert `(` after select function or method item
local cmp_ap_ok, cmp_autopairs = h.safe_require("nvim-autopairs.completion.cmp")
local cmp_ok, cmp = h.safe_require('cmp')
if cmp_ok and cmp_ap_ok then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

local rule_ok, Rule = h.safe_require("nvim-autopairs.rule")
if rule_ok then
autopairs.add_rules {
	-- before   insert  after
	--  (|)     ( |)	( | )
	Rule(' ', ' '):with_pair(
		function(opts)
			local pair = opts.line:sub(opts.col - 1, opts.col)
			return vim.tbl_contains({ '()', '[]', '{}' }, pair)
		end
	),
	Rule('( ', ' )'):with_pair(function() return false end):with_move(
		function(opts) return opts.prev_char:match('.%)') ~= nil end):use_key(')'),
	Rule('{ ', ' }'):with_pair(function() return false end):with_move(
		function(opts) return opts.prev_char:match('.%}') ~= nil end):use_key('}'),
	Rule('[ ', ' ]'):with_pair(function() return false end):with_move(
		function(opts) return opts.prev_char:match('.%]') ~= nil end):use_key(']'),
}
end
end

return M

-- ━━━━━━━━━━━━━━━━━❰ end Configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
