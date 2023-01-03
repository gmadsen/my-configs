return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  -- {
  --   "mfussenegger/nvim-treehopper",
  --   keys = { { "m", mode = { "o", "x" } } },
  --   config = function()
  --     vim.cmd([[
  --       omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
  --       xnoremap <silent> m :lua require('tsht').nodes()<CR>
  --     ]])
  --   end,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    -- dependencies = "andymass/vim-matchup",
    config = function()
      require("nvim-treesitter.configs").setup({
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
          "graphql",
          "help",
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
          "ninja",
          "nix",
          "norg",
          "org",
          "php",
          "python",
          "query",
          "regex",
          "rust",
          "scss",
          "sql",
          "svelte",
          "teal",
          "toml",
          "tsx",
          "typescript",
          "vhs",
          "vim",
          "vue",
          "wgsl",
          "yaml",
          -- "wgsl",
          "json",
          -- "markdown",
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
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = true, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
        -- matchup = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1000,
        },
      })
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.markdown.filetype_to_parsername = "octo"
    end,
  },
}
