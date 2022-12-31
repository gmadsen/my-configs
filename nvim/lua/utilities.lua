
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━❰ Utilities ❱━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

--[[
	 NOTE:
--]]

local api = vim.api

local group = api.nvim_create_augroup("GareAutoGroup", {clear=true})


api.nvim_create_autocmd(
	"TextYankPost",
	{
        desc = "highlight text on yank",
        pattern = "*",
		group = group,
		callback = function()
			vim.highlight.on_yank {
				higroup="Search", timeout=150, on_visual=true
			}
        end,
	}
)

api.nvim_create_autocmd(
	"BufWinEnter",
	{
        desc = "jump to the last position when reopening a file",
        pattern = "*",
		group = group,
		command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
	}
)

api.nvim_create_autocmd(
	"BufWritePre",
	{
		desc = "remove whitespaces on save",
		pattern = "*",
		group = group,
		command = "%s/\\s\\+$//e",
	}
)

api.nvim_create_autocmd(
	{"BufEnter", "FileType"},
	{
		desc = "don't auto comment new line",
		pattern = "*",
		group = group,
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	}
)

api.nvim_create_autocmd(
	"VimResized",
	{
		desc = "auto resize splited windows",
		pattern = "*",
		group = group,
		command = "tabdo wincmd =",
	}
)

api.nvim_create_autocmd(
	"BufWinEnter",
	{
		desc = "clear the last used search pattern",
		pattern = "*",
		group = group,
		command = "let @/ = ''",
	}
)

-- ━━━━━━━━━━━━━━━━❰ end of Automate ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━❰ end of Utilities ❱━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

