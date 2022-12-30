-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Configs ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

--[[
	 NOTE:
		every configs in this file are independent of any plugin
		configs for plugins are in "lua/plugins" directory and each plugin has
		it's own config file. some settings are already default in neovim so you
		don't need to define explicitly but it won't make any difference
    :end of NOTE
--]]

local g = vim.g -- global editor variables
local o = vim.o -- options, non-list
local opt = vim.opt -- options, list

g.python3_host_prog = "$HOME/venvs/neovim/bin/python3"
-- backup related options
-- neovim backup directory
local backup_dir = vim.fn.stdpath("data") .. "/.cache"
o.backup = false -- make backups before writing
o.swapfile = false
o.undofile = true -- persistent undos - undo after you re-open the file
o.writebackup = false -- Make backup before overwriting the current buffer
o.backupcopy = "yes" -- Overwrite the original backup file
o.directory = backup_dir .. "/swap" -- directory to place swap files in
o.backupdir = backup_dir .. "/backedUP" -- where to put backup files
o.undodir = backup_dir .. "/undos" -- where to put undo files
o.viewdir = backup_dir .. "/view" -- where to store files for :mkview
o.shada = "'100,<50,f50,n" .. backup_dir .. "/shada/shada"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true -- Enable GUI colors for the terminal to get truecolor

o.list = true -- show whitespace-- I think a plugin handles all the blank space

-- opt.listchars = {
--     nbsp = "⦸",                         -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
--     extends = "»",                      -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
--     precedes = "«",                     -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
--     tab = "▷",                          --  ─ WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
--     trail = "•",                        --  BULLET (U+2022, UTF-8: E2 80 A2)
--     space = " ",
-- }

opt.fillchars = {
  foldopen = "",
  foldclose = "",
}


opt.clipboard = vim.opt.clipboard + "unnamedplus" -- copy & paste
o.wrap = false -- don't automatically wrap on load
o.showmatch = true -- show the matching part of the pair for [] {} and ()

o.cursorline = false -- highlight current line
o.number = true -- show line numbers
o.relativenumber = true -- show relative line number

o.incsearch = true -- incremental search
o.hlsearch = true -- highlighted search results
o.ignorecase = true -- ignore case sensetive while searching
o.smartcase = true

o.scrolloff = 10 -- when scrolling, keep cursor 1 lines away from screen border
o.sidescrolloff = 5 -- keep 30 columns visible left and right of the cursor at all times
opt.backspace = { "indent", "start", "eol" } -- make backspace behave like normal again
o.mouse = "a" -- turn on mouse interaction
o.mousehide = true
o.updatetime = 500 -- CursorHold interval

o.softtabstop = 4
o.shiftwidth = 4 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
o.tabstop = 4 -- spaces per tab
o.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
o.autoindent = true -- maintain indent of current line
-- opt.expandtab = false -- don't expand tabs into spaces
o.expandtab = true

o.shiftround = true

o.splitbelow = true -- open horizontal splits below current window
o.splitright = true -- open vertical splits to the right of the current window
o.laststatus = 3 -- always show status line. 3 means Global Status Line
-- opt.colorcolumn = "79", -- vertical word limit line

o.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
-- (i am using nosplit) opt.inccommand = 'split' -- live preview of :s results
o.shell = "fish" -- shell to use for `!`, `:!`, `system()` etc.
o.lazyredraw = false -- faster scrolling

opt.wildignore:append({ "*.o", "*.rej", "*.so" }) -- patterns to ignore during file-navigation
-- o.wildmenu.enable = true
o.wildmode = "list:longest" -- command-line completion mode
o.completeopt = "menu,menuone,noselect" -- completion options
-- o.shortmess = "sAIcCqS" -- short duration messages
o.encoding = "utf-8" -- the encoding written to a file
o.fileencoding = "utf-8" -- the encoding written to a file
o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)

o.breakindent = true -- wrap lines with indent
o.signcolumn = "yes" -- always show sign column
o.pumheight = 20 -- maximum items in a popup menu
o.pumwidth = 30 --- min width of popup
o.cmdheight = 0 -- hide cmd bar
o.numberwidth = 4 -- number width

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions" --- settings to save for sessions


if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
end

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.o.shortmess = "filnxtToOFWIcC"
end








-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━❰ end of Plugin-Independent Configs ❱━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- disable built-in plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

g.do_filetype_lua = 1

vim.filetype.add({
    -- extension = {
    --     foo = "fooscript",
    -- },
    filename = {
        ["Podfile"] = "ruby",
    },
    pattern = {
        [".*git/config"] = "gitconfig",
        [".*env.*"] = "sh",
    },
})

-- Nice looking file diff
o.fillchars = "diff:/"

-- local global = require("core.global")

local function load_options()
	local global_local = {
		termguicolors = true,
		errorbells = true,
		visualbell = true,
		hidden = true,
		fileformats = "unix,mac,dos",
		magic = true,
		virtualedit = "block",
		encoding = "utf-8",
		viewoptions = "folds,cursor,curdir,slash,unix",
		sessionoptions = "curdir,help,tabpages,winsize",
		clipboard = "unnamedplus",
		wildignorecase = true,
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
		backup = false,
		writebackup = false,
		swapfile = false,
		undodir = global.cache_dir .. "undo/",
		-- directory = global.cache_dir .. "swap/",
		-- backupdir = global.cache_dir .. "backup/",
		-- viewdir = global.cache_dir .. "view/",
		-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
		history = 2000,
		shada = "!,'300,<50,@100,s10,h",
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
		smarttab = true,
		shiftround = true,
		timeout = true,
		ttimeout = true,
		-- You will feel delay when you input <Space> at lazygit interface if you set it a positive value like 300(ms).
		timeoutlen = 0,
		ttimeoutlen = 0,
		updatetime = 100,
		redrawtime = 1500,
		ignorecase = true,
		smartcase = true,
		infercase = true,
		incsearch = true,
		wrapscan = true,
		complete = ".,w,b,k",
		inccommand = "nosplit",
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		breakat = [[\ \	;:,!?]],
		startofline = false,
		whichwrap = "h,l,<,>,[,],~",
		splitbelow = true,
		splitright = true,
		switchbuf = "useopen",
		backspace = "indent,eol,start",
		diffopt = "filler,iwhite,internal,algorithm:patience",
		completeopt = "menuone,noselect",
		jumpoptions = "stack",
		showmode = false,
		shortmess = "aoOTIcF",
		scrolloff = 2,
		sidescrolloff = 5,
		mousescroll = "ver:3,hor:6",
		foldlevelstart = 99,
		ruler = true,
		cursorline = true,
		cursorcolumn = true,
		list = true,
		showtabline = 2,
		winwidth = 30,
		winminwidth = 10,
		pumheight = 15,
		helpheight = 12,
		previewheight = 12,
		showcmd = false,
		cmdheight = 2, -- 0, 1, 2
		cmdwinheight = 5,
		equalalways = false,
		laststatus = 2,
		display = "lastline",
		showbreak = "↳  ",
		listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
		-- pumblend = 10,
		-- winblend = 10,
		autoread = true,
		autowrite = true,

		undofile = true,
		synmaxcol = 2500,
		formatoptions = "1jcroql",
		expandtab = true,
		autoindent = true,
		tabstop = 4,
		shiftwidth = 4,
		softtabstop = 4,
		breakindentopt = "shift:2,min:20",
		wrap = false,
		linebreak = true,
		number = true,
		relativenumber = true,
		foldenable = true,
		signcolumn = "yes",
		conceallevel = 0,
		concealcursor = "niv",
	}
	local function isempty(s)
		return s == nil or s == ""
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = conda_prefix .. "/bin/python"
		vim.g.python3_host_prog = conda_prefix .. "/bin/python"
	elseif global.is_mac then
		vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/local/bin/python3"
	else
		vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/bin/python3"
	end

	for name, value in pairs(global_local) do
		vim.o[name] = value
	end
end

-- load_options()
