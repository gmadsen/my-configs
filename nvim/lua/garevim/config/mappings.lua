-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Mapping ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
--[===[
--]===]

local options = { noremap = true, silent = true }
local map = vim.keymap.set
local cmd = vim.cmd

-- smart deletion, dd
-- It solves the issue, where you want to delete empty line, but dd will override you last yank.
-- Code above will check if u are deleting empty line, if so - use black hole register.
-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
local function smart_dd()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end
map("n", "dd", smart_dd, { expr = true })

-- Edit and reload nvim config file quickly
map("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", { silent = true, desc = "open init.lua" })

-- Close buffer
cmd([[ autocmd BufEnter * nmap <silent> <buffer> <leader>q :bd<CR> ]])
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "man", "help", "lspinfo", "null-ls-info", "mason" },
  command = "nnoremap <silent> <buffer> <leader>q :close<CR>",
})
map("n", "<leader>Q", ":qall<cr>")
map("n", "<leader>w", ":wall<cr>")
-- map ctl+z to nothing so that it don't suspend terminal
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "nnoremap <c-z> <nop>" })

-- scroll window up/down
map("i", "<C-e>", "<ESC><C-e>")
map("i", "<C-y>", "<ESC><C-y>")
-- remap the key used to leave insert mode
map("i", "jk", "<Esc>", {})
-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
-- Y yank until the end of line  (note: this is now a default on master)
map("n", "Y", "y$", {})
-- tabs and buffers, I don't like
map("n", "<leader>bn", ":enew<cr>")
map("n", "<leader>be", ':edit <C-r>=expand("%:p:h")<cr>/')
-- map("n", "<leader>bq", ":bd<cr>")
map("n", "<leader>k", ":bnext<cr>")
map("n", "<leader>bl", ":bnext<cr>")
map("n", "<leader>bh", ":bprevious<cr>")
map("n", "<leader>j", ":bprevious<cr>")
map("n", "<leader>tn", ":tabnew<cr>")
map("n", "<leader>to", ":tabonly<cr>")
map("n", "<leader>tq", ":tabclose<cr>")
map("n", "<leader>th", ":tabprevious<cr>")
map("n", "<leader>tl", ":tabnext<cr>")
map("n", "<leader>te", ':tabedit <C-r>=expand("%:p:h")<cr>/')
map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

--[[
      easier moving of code blocks
      Try to go into visual mode (v), thenselect several lines of code
      here and then press ``>`` several times.
--]]
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- going back to normal mode which works even in vim's terminal
-- you will need this if you use floaterm to escape terminal
map("t", "<Esc>", "<c-\\><c-n>", options)

-- move selected line(s) up or down
map("v", "J", ":m '>+1<CR>gv=gv", options)
map("v", "K", ":m '<-2<CR>gv=gv", options)

-------------------------------- Plugin Mappings

-------------------------Toggle Nvim-Tree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

----------------------------- Hop ------------------------
map("n", "F", "<cmd>lua require('hop').hint_words()<cr>", options)

---------------------------- BufferLine----------------------
-- go to buffer number
map("n", "<Leader>1", ":BufferLineGoToBuffer 1<CR>", options)
map("n", "<Leader>2", ":BufferLineGoToBuffer 2<CR>", options)
map("n", "<Leader>3", ":BufferLineGoToBuffer 3<CR>", options)
map("n", "<Leader>4", ":BufferLineGoToBuffer 4<CR>", options)
map("n", "<Leader>5", ":BufferLineGoToBuffer 5<CR>", options)
map("n", "<Leader>6", ":BufferLineGoToBuffer 6<CR>", options)
map("n", "<Leader>7", ":BufferLineGoToBuffer 7<CR>", options)
map("n", "<Leader>8", ":BufferLineGoToBuffer 8<CR>", options)
map("n", "<Leader>9", ":BufferLineGoToBuffer 9<CR>", options)

map("n", "<Leader>bq", ":BufferClose<CR>", options)

------------------ Terminal---------------------------
-- map("n", "<A-i>", "<CMD>lua require('FTerm').toggle()<CR>", options)
map("n", "<Leader>i", "<CMD>lua require('FTerm').toggle()<CR>", options)
-- map("t", "<A-i>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", options)
map("t", "<Leader>i", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", options)

-------------------Trouble-----------------------------
map("n", "<leader>xt", "<cmd>TroubleToggle<cr>")
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
map("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- hlslens , which makes search more fancy
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "//", ":noh<CR>", options)

------------------------- Telescope Mappings --------------------------------
--      --> Launch Telescope without any argument
-- map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').builtin() <CR>", options)
-- --      --> Lists available Commands
-- map("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands() <CR>", options)
-- --      --> Lists available help tags and opens a new window with the relevant help info on
-- map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags() <CR>", options)
-- --       --> show all availabe MAPPING
-- map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').keymaps() <CR>", options)
-- --       --> show buffers/opened files
-- map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers() <CR>", options)
-- --       --> show and grep current buffer
-- map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find() <CR>", options)
-- map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep() <CR>", options)
-- --       --> show all files from current working directory
-- -- map("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects() <CR>")
-- map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>") -- { cwd = vim.fn.expand('%:p:h') }) <CR>")
-- --       --> show undo history
-- map("n", "<leader>fu", "<cmd>Telescope undo<cr>")

-- local ht = require('haskell-tools')
-- Toggle a GHCi repl for the current package
-- vim.keymap.set('n', '<leader>rr', ht.repl.toggle)
-- Toggle a GHCi repl for the current buffer
-- vim.keymap.set('n', '<leader>rf', function()
--  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
-- end)
-- vim.keymap.set('n', '<leader>rq', ht.repl.quit)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━❰ end of Plugin Mapping ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
