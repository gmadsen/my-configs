return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "williamboman/mason-lspconfig.nvim",


  -- Theme: icons
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },

 {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = {
      auto_open = false,
      use_diagnostic_signs = true, -- en
    },
  },


  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "BufReadPre",
  --   config = true,
  -- },

  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },
}
