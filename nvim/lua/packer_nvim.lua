-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Packer Plugin Manager ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
-- add the following snippet (which is due to @Iron-E) somewhere in your config before your first usage of packer:

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- safely import packer
local import_packer, packer = pcall(require, "packer")
if not import_packer then
  return
end

return packer.startup({
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua",

    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
    git = {
      cmd = "git", -- The base command for git operations
      depth = 1, -- Git clone depth
      clone_timeout = 600, -- Timeout, in seconds, for git clones
    },
  },

  function(use)
    -- ━━━━━━━━━━━━━━━━━❰ Required plugins ❱━━━━━━━━━━━━━━━━━ --
    use("wbthomason/packer.nvim") -- Packer can manage itself
    use("lewis6991/impatient.nvim") -- Speed up loading Lua modules in Neovim to improve startup time.
    use(require("config.plugins"))
    use(require("config.plugins.catppuccin"))

    -- ━━━━━━━━━━━━━━━━❰ UI Plugins ❱━━━━━━━━━━━━━━━━ --
    use(require("config.plugins.nvim-tree"))
    -- use(require("config.plugins.notify"))
    -- vim.notify = require("notify")

    --use(require("config.plugins.noice"))



    -- use(require("config.plugins.autopairs"))
    -- use(require("config.plugins.cmp")) -- A completion plugin for neovim coded in Lua.


    -- use({ ----- LUA NVIM DEVELOPMENT
    --   "folke/neodev.nvim",
    --   config = function()
    --     require("neodev").setup({})
    --   end,
    --   requires = { "nvim-lspconfig", "hrsh7th/nvim-cmp" },
    -- })

    use("anuvyklack/hydra.nvim")
    use("ellisonleao/glow.nvim")
    use({ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } })

    use({ -- floating terming
      "numToStr/FTerm.nvim",
      config = [[ require('plugins/fterm_nvim') ]],
    })
    use(require("config.plugins.hlslens")) -- advanced search and search highlighing



    -- use("simrat39/rust-tools.nvim")
    -- ━━━━━━━━━━━━━━━━❰ LSP Plugins ❱━━━━━━━━━━━━━━━━ --
    -- use({ -- A collection of common configurations for Neovim's built-in language server client
    --   "neovim/nvim-lspconfig",
    --   event = "BufRead",
    --   requires = {
    --     { -- Companion plugin for nvim-lspconfig  install LSP servers locally (inside :echo stdpath("data")).
    --       "williamboman/mason.nvim",
    --       requires = {
    --         { -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
    --           "williamboman/mason-lspconfig.nvim",
    --         },
    --         { -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    --           "jose-elias-alvarez/null-ls.nvim",
    --           requires = { "jayp0521/mason-null-ls.nvim" },
    --         },
    --       },
    --     },
    --   },
    --   config = [[
	-- 			require('plugins/nvim-lspconfig')
	-- 			require('plugins/null-ls_nvim')
	-- 		]],
    -- })

    -- use({ -- i guess another signature popup
    --   "ray-x/lsp_signature.nvim",
    --   event = "InsertEnter",
    --   config = [[ require('plugins/lspsignature') ]],
    -- })

    -- use(require("config.plugins.trouble")) -- A pretty diagnostics, references,tell the trouble your code is causing.
    -- use({ -- A Neovim plugin that provides a colors for text diagnostics display.
    --   "folke/lsp-colors.nvim",
    --   config = [[ require('plugins/lsp-colors') ]],
    -- })
    -- use({ -- copilot in nvim
    --   "zbirenbaum/copilot.lua",
    --   event = "VimEnter",
    --   config = [[ require('plugins/copilot') ]],
    -- })
    use({ -- vscode-like pictograms for neovim lsp completion items Topics
       "onsails/lspkind-nvim",
     })
    -- -- ━━━━━━━━━━━━━━━━❰ TS Plugins ❱━━━━━━━━━━━━━━━━ --
    
    -- -- Uses winscroll and TS to give context as you scroll down a file
    use(require("config.plugins.treesitter"))

    -- use(require("config.plugins.luasnip"))
    -- use({
    --   "zbirenbaum/copilot-cmp",
    --   after = { "copilot.lua" },
    --   config = function()
    --     require("copilot_cmp").setup()
    --   end,
    -- })
    -- -- ━━━━━━━━━━━━━━━━❰ Completion Plugins ❱━━━━━━━━━━━━━━━━ --

    -- -- ━━━━━━━━━━━━━━━━❰ Telescope Plugins ❱━━━━━━━━━━━━━━━━ --
    -- use(require("config.plugins.telescope"))

    -- -- ━━━━━━━━━━━━━━━━❰ Editing Plugins ❱━━━━━━━━━━━━━━━━ --

    use({ --  Add/change/delete surrounding delimiter pairs with ease.
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup({})
      end,
    })
     use({ -- auto  commentstring, dot repeat, left-right/up-down motions, hooks, and more
       "numToStr/Comment.nvim",
       config = [[ require('plugins/Comment_nvim') ]],
     })

    use(require("config.plugins.indent-blankline"))
    use(require("config.plugins.bufferline"))
    use(require("config.plugins.lualine")) -- fancy status line

    -- use({ -- Git signs written in pure lua
    --   "lewis6991/gitsigns.nvim",
    --   opt = true,
    --   event = { "BufReadPost", "BufNewFile" },
    --   config = [[ require('plugins/gitsigns_nvim') ]],
    -- })

    use({ -- fast and highly customizable greeter for neovim.
      "goolord/alpha-nvim",
      opt = true,
      event = "BufWinEnter",
      config = [[ require('plugins/alpha-nvim') ]],
    })
    use({ -- tmux easy yank/past and window switching
      "aserowy/tmux.nvim",
      config = [[ require('plugins/tmux') ]],
    })
    -- -- use({
    -- --   "rmagatti/auto-session",
    -- --   config = function()
    -- --     require("auto-session").setup({
    -- --       log_level = "error",
    -- --       auto_session_suppress_dirs = {
    -- --         "~/",
    -- --         "~/Projects",
    -- --         "~/Downloads",
    -- --         "/",
    -- --       },
    -- --     })
    -- --   end,
    -- -- })

    -- use({
    --   "folke/todo-comments.nvim",
    --   requires = "nvim-lua/plenary.nvim",
    --   config = function()
    --     require("todo-comments").setup({})
    --   end,
    -- })
    -- use({ --  Neovim motions on speed!
    --   "phaazon/hop.nvim",
    --   config = [[ require('plugins/hop_nvim') ]],
    -- })
    -- use({ -- smooth scrolling for neovim
    --   "karb94/neoscroll.nvim",
    --   config = [[ require('plugins/neoscroll_nvim') ]],
    -- })
    -- -- use({ -- highlight arguments of a function call using treesitter
    -- --   "m-demare/hlargs.nvim",
    -- --   requires = { "nvim-treesitter/nvim-treesitter" },
    -- -- })
    -- use({ -- Highlight other uses of word under cursor
    --   "RRethy/vim-illuminate",
    --   config = [[ require('plugins/vim-illuminate') ]],
    -- })
    -- use({ -- an lsp plugin to help stuff
    --   "glepnir/lspsaga.nvim",
    --   config = [[ require('plugins/lspsaga_nvim') ]],
    -- })
    -- ━━━━━━━━━━━━━━━━━❰ DEVELOPMENT ❱━━━━━━━━━━━━━━━━━ --
    -- ━━━━━━━━━━━━━━❰ end of DEVELOPMENT ❱━━━━━━━━━━━━━ --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      packer.sync()
    end
  end,
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
