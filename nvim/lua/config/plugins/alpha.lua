-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    alpha-nvim
--   Github:    github.com/goolord/alpha-nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local M = {
    "goolord/alpha-nvim",
    event = "BufWinEnter",
}

function M.setup()
local h = require("util.helpers")

local alpha_ok, alpha = h.safe_require("alpha")
if not alpha_ok then return end

local dashboard_ok, dashboard = h.safe_require("alpha.themes.dashboard")
if not dashboard_ok then return end

local datetime_ok, datetime = pcall(os.date, "%I:%M:%p 🕔 %d-%m-%Y")
local version_ok, nvim_version = pcall(os.capture, "nvim --version | awk 'NR == 1'")


local function footer()
	if version_ok and datetime_ok then
		return nvim_version .. ' | ' .. datetime
	elseif datetime_ok then
		return datetime
	else return ""
	end
end

dashboard.section.header.val = {

	"   █████████   █████              █████                                  █████   ",
	"  ███░░░░░███ ░░███              ░░███                                  ░░███    ",
	" ░███    ░███  ░███████   █████  ███████   ████████   ██████    ██████  ███████  ",
	" ░███████████  ░███░░███ ███░░  ░░░███░   ░░███░░███ ░░░░░███  ███░░███░░░███░   ",
	" ░███░░░░░███  ░███ ░███░░█████   ░███     ░███ ░░░   ███████ ░███ ░░░   ░███    ",
	" ░███    ░███  ░███ ░███ ░░░░███  ░███ ███ ░███      ███░░███ ░███  ███  ░███ ███",
	" █████   █████ ████████  ██████   ░░█████  █████    ░░████████░░██████   ░░█████ ",
	"░░░░░   ░░░░░ ░░░░░░░░  ░░░░░░     ░░░░░  ░░░░░      ░░░░░░░░  ░░░░░░     ░░░░░  ",
}

-- Set menu
local options = {}
local update_cmd = ":FloatermNew cd ~/.config/nvim/ && "
update_cmd = update_cmd .. "echo updating configs... && "
update_cmd = update_cmd .. "git pull && "
update_cmd = update_cmd .. "echo updating plugins... && "
update_cmd = update_cmd .. "nvim --headless -c 'autocmd User PackerComplete quitall' -c PackerSync && "
update_cmd = update_cmd .. "echo updated && "
update_cmd = update_cmd .. " <CR><CR>"
dashboard.section.buttons.val = {
	dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>", options),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>", options),
	-- dashboard.button("<C-S>", "S  > Projects", ":Telescope projects<CR>", options),
	dashboard.button("f", "  > Find file", ":Telescope find_files<CR>", options),
	dashboard.button("s", "  > Settings", ":e ~/.config/nvim/init.lua <CR>", options),
	dashboard.button("u", "  > Update Plugins", update_cmd, options),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>", options),

}

dashboard.section.footer.val = footer()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

end

return M
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
