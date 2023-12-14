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

-------- Variables --------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local cache_dir = vim.fn.stdpath("data") .. "/.cache"
vim.g.python3_host_prog = "$HOME/venvs/neovim/bin/python3"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------for plugin----------
vim.g.loaded_matchit = 1

local indent = 2
----------- Global Options -----------------
vim.o.autoindent = true -- maintain indent of current line
vim.o.autowrite = true
vim.opt.backspace = { "indent", "start", "eol" } -- make backspace behave like normal again
vim.o.backup = true -- make backups before writing
vim.o.backupcopy = "yes" -- Overwrite the original backup file
vim.o.backupdir = cache_dir .. "/backup" -- where to put backup files
vim.o.breakindent = true -- wrap lines with indent
vim.o.clipboard = "unnamedplus" -- copy & paste
vim.o.cmdheight = 0 -- hide cmd bar
-- opt.colorcolumn = "79", -- vertical word limit line
vim.o.completeopt = "menu,menuone,noselect" -- completion options
vim.o.conceallevel = 3
vim.o.confirm = true -- do not confirm to save on
vim.o.cursorline = false -- highlight current line
vim.o.directory = cache_dir .. "/swap" -- directory to place swap files in
vim.o.encoding = "utf-8" -- the encoding written to a file
vim.o.expandtab = true -- expand tabs into spaces
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.fillchars = {
  diff = "/",
  foldopen = "",
  foldclose = "",
  eob = " ",
}
vim.o.formatoptions = "jcroqlnt"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --hidden --vimgrep --smart-case --"
vim.o.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
vim.o.hlsearch = true -- highlighted search results
vim.o.ignorecase = true -- ignore case sensetive while searching
vim.o.inccommand = "nosplit" -- live preview of :s results
vim.o.incsearch = true -- incremental search
vim.o.laststatus = 3 -- always show status line. 3 means Global Status Line
vim.o.lazyredraw = false -- faster scrolling
vim.o.list = true -- show whitespace-- I think a plugin handles all the blank space
vim.o.mouse = "a" -- turn on mouse interaction
vim.o.mousehide = true
vim.o.number = true -- show line numbers
vim.o.numberwidth = 4 -- number width
vim.o.pumblend = 10 -- pop up blend
vim.o.pumheight = 10 -- maximum items in a popup menu
--o.pumwidth = 30 --- min width of popup
vim.o.relativenumber = true -- show relative line number
vim.o.scrolloff = 10 -- when scrolling, keep cursor 1 lines away from screen border
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions" --- settings to save for sessions
vim.o.shada = "'100,<50,f50,n" .. cache_dir .. "/shada/shada"
vim.o.shell = "fish" -- shell to use for `!`, `:!`, `system()` etc.
vim.o.shiftround = true -- make all indents a multiple of shiftwidth
vim.o.shiftwidth = indent -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
vim.o.shortmess = "filnxtToOFWIcC"
vim.o.showmatch = true -- show the matching part of the pair for [] {} and ()
vim.o.sidescrolloff = 4 -- keep 30 columns visible left and right of the cursor at all times
vim.o.signcolumn = "yes" -- always show sign column
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
vim.o.softtabstop = 4
vim.opt.spelllang = { "en" }
vim.o.splitbelow = true -- open horizontal splits below current window
vim.o.splitright = true -- open vertical splits to the right of the current window
vim.o.swapfile = false

vim.o.tabstop = indent -- spaces per tab
vim.opt.termguicolors = true -- Enable GUI colors for the terminal to get truecolor
vim.o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)

vim.o.undodir = cache_dir .. "/undos" -- where to put undo files
vim.o.undofile = true -- persistent undos - undo after you re-open the file
vim.o.undolevels = 10000
vim.o.updatetime = 200 -- CursorHold interval
vim.o.viewdir = cache_dir .. "/view" -- where to store files for :mkview
-- vim.o.wildmenu.enable = true
vim.opt.wildignore:append({ "*.o", "*.rej", "*.so" }) -- patterns to ignore during file-navigation
vim.o.wildmode = "longest:full,full" -- command-line completion mode
vim.o.wrap = false --  automatically wrap on load
vim.o.writebackup = true -- Make backup before overwriting the current buffer
vim.opt.splitkeep = "screen"

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━❰ Special configs ❱━━━━━━━━━━━━━━━━━━━━━━ --
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
  vim.g["loaded_" .. plugin] = 1
end

vim.g.do_filetype_lua = 1
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
