-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    alpha-nvim
--   Github:    github.com/goolord/alpha-nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
return {
  "goolord/alpha-nvim",
  lazy = false,
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    -- local datetime_ok, datetime = pcall(os.date, "%I:%M:%p 🕔 %d-%m-%Y")
    -- local version_ok, nvim_version = pcall(os.capture, "nvim --version | awk 'NR == 1'")

    -- local function footer()
    --   if version_ok and datetime_ok then
    --     return nvim_version .. " | " .. datetime
    --   elseif datetime_ok then
    --     return datetime
    --   else
    --     return ""
    --   end
    -- end

    local logo = [[

    "   █████████   █████              █████                                  █████   ",
    "  ███░░░░░███ ░░███              ░░███                                  ░░███    ",
    " ░███    ░███  ░███████   █████  ███████   ████████   ██████    ██████  ███████  ",
    " ░███████████  ░███░░███ ███░░  ░░░███░   ░░███░░███ ░░░░░███  ███░░███░░░███░   ",
    " ░███░░░░░███  ░███ ░███░░█████   ░███     ░███ ░░░   ███████ ░███ ░░░   ░███    ",
    " ░███    ░███  ░███ ░███ ░░░░███  ░███ ███ ░███      ███░░███ ░███  ███  ░███ ███",
    " █████   █████ ████████  ██████   ░░█████  █████    ░░████████░░██████   ░░█████ ",
    "░░░░░   ░░░░░ ░░░░░░░░  ░░░░░░     ░░░░░  ░░░░░      ░░░░░░░░  ░░░░░░     ░░░░░  ",
 ]]

    -- dashboard.section.header.val = {
    -- Set menu
    -- local update_cmd = ":FTermNew cd ~/.config/nvim/ && "
    -- update_cmd = update_cmd .. "git pull && "
    -- update_cmd = update_cmd .. "echo updating configs... && "
    -- update_cmd = update_cmd .. "echo updating garevim.plugins... && "
    -- update_cmd = update_cmd .. "nvim --headless -c 'autocmd User PackerComplete quitall' -c PackerSync && "
    -- update_cmd = update_cmd .. "echo updated && "
    -- update_cmd = update_cmd .. " <CR><CR>"
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
      --dashboard.button("<C-S>", "S  > Projects", ":Telescope projects<CR>", options),
      dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
      -- dashboard.button("u", "  > Update Plugins", update_cmd, options),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }
    -- dashboard.section.footer.val = footer()
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.opts.layout[1].val = 8

    if vim.o.filetype == "lazy" then
      -- close and re-open Lazy after showing alpha
      vim.notify("Missing plugins installed!", vim.log.levels.INFO, { title = "lazy.nvim" })
      vim.cmd.close()
      require("alpha").setup(dashboard.opts)
      require("lazy").show()
    else
      require("alpha").setup(dashboard.opts)
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
-- Send config to alpha
-- Disable folding on alpha buffer
-- vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
-- return M
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
