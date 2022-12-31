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
local autopairs = require("autopairs")
autopairs.setup({
	enable_check_bracket_line = true, -- Don't add pairs if it already have a close pairs in same line
	disable_filetype = { "TelescopePrompt", "vim" }, --
	enable_afterquote = false, -- add bracket pairs after quote
	enable_moveright = true,

	-- use treesitter to check for a pair.
	check_ts = true,
	ts_config = {
		-- lua = {'string'},-- it will not add a pair on that treesitter node
		-- javascript = {'template_string', 'string'},
		-- java = false,-- don't check treesitter on java
	}

})

-- this is nvim-cmp Plugin dependent setting
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('autopairs.completion.cmp')

local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local Rule = require('autopairs.rule')

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

return M

-- ━━━━━━━━━━━━━━━━━❰ end Configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
