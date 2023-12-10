local M = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end
}


function M.config()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    -- dependencies = "andymass/vim-matchup",
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      -- "comment", -- comments are slowing down TS bigtime, so disable for now
      "cpp",
      "css",
      "diff",
      "fish",
      "gitignore",
      "go",
      "html",
      "http",
      "java",
      "javascript",
      "jsdoc",
      "jsonc",
      "latex",
      "lua",
      "markdown",
      "markdown_inline",
      "meson",
      "php",
      "python",
      "query",
      "regex",
      "rust",
      "sql",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "json",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
      enable = true,
      disable = function()
        return vim.api.nvim_buf_line_count(0) > 6000
      end,
    },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    -- context_commentstring = { enable = true, enable_autocmd = false },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<C-s>",
        node_decremental = "<C-bs>",
      },
    },
    -- matchup = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    }
  })
end

return { M }
