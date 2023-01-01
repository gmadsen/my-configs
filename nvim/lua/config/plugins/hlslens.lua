
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    hlslens.nvim
--   Github:    github.com/kevinhwang91/hlslens.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M = {
    'kevinhwang91/nvim-hlslens',
}

M.config = function()
    require('hlslens').setup {
        calm_down = true,
        nearest_only = true,
        nearest_float_when = 'always',
    }

local map = vim.keymap.set
local cmd = vim.cmd
local options = { noremap = true, silent = true }



-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- hlslens , which makes search more fancy
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "<Leader>l", ":noh<CR>", options)



end

return M

