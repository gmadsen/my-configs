
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Mapping ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
--[===[
        this config file contains the mapping that don't depends
        on any plugin. mappings for plugins-dependent are in
        lua/plugin" directory. each plugin has it's own config file

        To see the current mapping for |<Leader>| type :echo mapleader.
        If it reports an undefined variable it means the leader key is
        set to the "default of '\'.
        i defined leader on very start of init.lua file so that every
        keymap would work
--]===]


local keymap  = vim.api.nvim_set_keymap
local map     = vim.keymap.set
local cmd     = vim.cmd
local options = {noremap = true, silent = true}
local silent  = {silent = true}


-- smart deletion, dd
-- It solves the issue, where you want to delete empty line, but dd will override you last yank.
-- Code above will check if u are deleting empty line, if so - use black hole register.
-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return "\"_dd"
	else return "dd" end
end
vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })


-- Edit and reload nvim config file quickly
map("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
	silent = true,
	desc = "open init.lua",
  })

-- map("n", "<leader>sv", "", {
-- 	silent = true,
-- 	desc = "reload init.lua",
-- 	callback = function()
-- 	  vim.cmd([[
-- 		update $MYVIMRC
-- 		source $MYVIMRC
-- 	  ]])
-- 	  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO  , { title = "nvim-config" })
-- 	end,
-- })
-- Close buffer
cmd([[ autocmd BufEnter * nmap <silent> <buffer> <leader>q :bd<CR> ]])
vim.api.nvim_create_autocmd(
	"FileType",
	{
		pattern = {
			"man", "help", "lspinfo", "null-ls-info", "mason"
		},
		command = "nnoremap <silent> <buffer> <leader>q :close<CR>",
	}
)

-- map ctl+z to nothing so that it don't suspend terminal
vim.api.nvim_create_autocmd(
	"BufEnter",
	{
		pattern = "*",
		command = "nnoremap <c-z> <nop>"
	}
)

-- scroll window up/down
map('i', '<C-e>', '<ESC><C-e>')
map('i', '<C-y>', '<ESC><C-y>')
-- clear Search Results
map('n', '??', ':noh <CR>')
-- remap the key used to leave insert mode
map('i', 'jk', '<Esc>', {})
--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
-- Y yank until the end of line  (note: this is now a default on master)
map('n', 'Y', 'y$', {})
-- tabs and buffers, I don't like
map('n', '<leader>bn', ':enew<cr>')
map('n', '<leader>be', ':edit <C-r>=expand("%:p:h")<cr>/')
map('n', '<leader>bq', ':bd<cr>')
map('n', '<leader>bl', ':bnext<cr>')
map('n', '<leader>bh', ':bprevious<cr>')
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>to', ':tabonly<cr>')
map('n', '<leader>tq', ':tabclose<cr>')
map('n', '<leader>th', ':tabprevious<cr>')
map('n', '<leader>tl', ':tabnext<cr>')
map('n', '<leader>te', ':tabedit <C-r>=expand("%:p:h")<cr>/')
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>')

--[[
      easier moving of code blocks
      Try to go into visual mode (v), thenselect several lines of code
      here and then press ``>`` several times.
--]]
keymap('v', '<', '<gv', options)
keymap('v', '>', '>gv', options)

-- going back to normal mode which works even in vim's terminal
-- you will need this if you use floaterm to escape terminal
keymap('t', '<Esc>', '<c-\\><c-n>', options)

	-- move selected line(s) up or down
keymap('v', 'J', ":m '>+1<CR>gv=gv", options)
keymap('v', 'K', ":m '<-2<CR>gv=gv", options)


-------------------------------- Plugin Mappings

-- Rename
map('n', '<Space>R', '<cmd>Lspsaga rename<cr>')
map('v', '<Space>R', '<cmd>Lspsaga rename<cr>')
-- LSP
map('n', '<Space>f', '<ESC>:lua vim.lsp.buf.format()<CR>')
-- -----------------------Toggle Nvim-Tree
map('n', '<leader>n', ':NvimTreeToggle<CR>')

----------------------------- Hop ------------------------
map( 'n', 'F', "<cmd>lua require'hop'.hint_words()<cr>", options)
---------------------------- BufferLine
-- go to buffer number
map('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', options)
map('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', options)
map('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', options)
map('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', options)
map('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', options)
map('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>', options)
map('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>', options)
map('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>', options)
map('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>', options)
-- Telescope Mappings
--      --> Launch Telescope without any argument
map('n', "<leader>ft",   "<cmd>lua require('telescope.builtin').builtin() <CR>", options)
--      --> Lists available Commands
map('n', "<leader>fc",   "<cmd>lua require('telescope.builtin').commands() <CR>", options)
--      --> Lists available help tags and opens a new window with the relevant help info on
map('n', "<leader>fh",   "<cmd>lua require('telescope.builtin').help_tags() <CR>", options)
--       --> show all availabe MAPPING
map('n', "<leader>fm", "<cmd>lua require('telescope.builtin').keymaps() <CR>", options)
--       --> show buffers/opened files
map('n', "<leader>fb",  "<cmd>lua require('telescope.builtin').buffers() <CR>", options)
--       --> show and grep current buffer
map('n', "<leader>fw", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find() <CR>", options)
map('n', "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep() <CR>", options)
--       --> show all files from current working directory
map('n', "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects() <CR>")
map('n', "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")--{ cwd = vim.fn.expand('%:p:h') }) <CR>")

-------------- floaterm
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
-- GoTo preview
map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", options)
map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", options)
map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", options)






-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
map({"n","v"}, "<Space>ca", "<cmd>Lspsaga code_action<CR>" )

-- Rename
-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>" )

-- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>" )

-- Show cursor diagnostic
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>" )

-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>" )
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>" )

-- Only jump to error
map("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
map("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Outline
map("n","<leader>o", "<cmd>LSoutlineToggle<CR>")

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
-- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]],j















local Hydra = require('hydra')
Hydra({
   name = 'Side scroll',
   mode = 'n',
   body = 'z',
   heads = {
      { 'h', '5zh' },
      { 'l', '5zl', { desc = '←/→' } },
      { 'H', 'zH' },
      { 'L', 'zL', { desc = 'half screen ←/→' } },
   }
})
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━❰ end of Plugin Mapping ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

