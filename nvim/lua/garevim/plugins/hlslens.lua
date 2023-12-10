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
  "kevinhwang91/nvim-hlslens",
  event = "BufWinEnter",
}

M.config = function()
  local hls = require("hlslens")

  hls.setup({
    calm_down = true,
    nearest_only = true,
    nearest_float_when = "always",
  })

  local options = { noremap = true, silent = true }
  local map = vim.keymap.set
  -- hlslens , which makes search more fancy
  map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
  map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
  map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], options)
  map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], options)
  map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], options)
  map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], options)
  map("n", "//", ":noh<CR>", options)
end

return M
