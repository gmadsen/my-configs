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

o.list = true -- show whitespace
-- opt.listchars = { -- I think a plugin handles all the blank space
--     nbsp = "⦸ ",   -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
--     extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
--     precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
--     tab = " ",      --  ▷─ WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
--     trail = "•",    --  BULLET (U+2022, UTF-8: E2 80 A2)
--     space = " ",
-- }
-- opt.fillchars = {
--     -- diff = '∙', -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
--     eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
--     -- fold = '·', -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
--     -- vert = '│', -- window border when window splits vertically ─ ┴ ┬ ┤ ├ ┼
-- }
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
opt.shortmess:append("sAIcCqS") -- short duration messages
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
