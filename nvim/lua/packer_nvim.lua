-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--    Plugin:    packer.nvim
--    Github:    github.com/wbthomason/packer.nvim
-- A use-package inspired plugin manager for Neovim.
-- Uses native packages, supports Luarocks dependencies,
-- written in Lua, allows for expressive config
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
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

    local cat = require("config.plugins.catppuccin")
    use(cat)
    vim.cmd("colorscheme catppuccin")

    use("nvim-lua/plenary.nvim") -- comment functions for all plugins
    use("MunifTanjim/nui.nvim")

    use({ -- lua `fork` of vim-web-devicons for neovim
      "kyazdani42/nvim-web-devicons",
      config = [[ require('plugins/nvim-web-devicons') ]],
    })

    -- ━━━━━━━━━━━━━━━━❰ UI Plugins ❱━━━━━━━━━━━━━━━━ --

    use({ -- fancy notify box
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify")
      end,
    })
    use(require("config.plugins.noice"))

    use({ ----- LUA NVIM DEVELOPMENT
      "folke/neodev.nvim",
      config = function()
        require("neodev").setup({})
      end,
      requires = { "nvim-lspconfig", "nvim-cmp" },
    })

    -- ━━━━━━━━━━━━━━━━❰ LSP Plugins ❱━━━━━━━━━━━━━━━━ --
    use({ -- A collection of common configurations for Neovim's built-in language server client
      "neovim/nvim-lspconfig",
      event = "BufRead",
      requires = {
        { -- Companion plugin for nvim-lspconfig  install LSP servers locally (inside :echo stdpath("data")).
          "williamboman/mason.nvim",
          requires = {
            { -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
              "williamboman/mason-lspconfig.nvim",
              "simrat39/rust-tools.nvim",
            },
            { -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
              "jose-elias-alvarez/null-ls.nvim",
              requires = { "jayp0521/mason-null-ls.nvim" },
            },
          },
        },
      },
      config = [[
				require('plugins/nvim-lspconfig')
				require('plugins/null-ls_nvim')
			]],
    })

    -- use({ -- i guess another signature popup
    -- 	"ray-x/lsp_signature.nvim",
    -- 	event = "InsertEnter",
    -- 	config = [[ require('plugins/lspsignature') ]],
    -- })

    use({ -- A pretty diagnostics, references,tell the trouble your code is causing.
      "folke/trouble.nvim",
      after = "nvim-lspconfig",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[ require('plugins/trouble_nvim') ]],
    })
    use({ -- A Neovim plugin that provides a colors for text diagnostics display.
      "folke/lsp-colors.nvim",
      config = [[ require('plugins/lsp-colors') ]],
    })
    use({ -- copilot in nvim
      "zbirenbaum/copilot.lua",
      event = "VimEnter",
      config = [[ require('plugins/copilot') ]],
    })
    use({ -- vscode-like pictograms for neovim lsp completion items Topics
      "onsails/lspkind-nvim",
    })
    -- ━━━━━━━━━━━━━━━━❰ TS Plugins ❱━━━━━━━━━━━━━━━━ --
    use({ -- Nvim Treesitter configurations and abstraction layer
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = [[ require('plugins/nvim-treesitter') ]],
      requires = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    })
    use({ --  Use treesitter to auto close and auto rename html tag, work with html,tsx,vue,svelte,php.
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = [[ require('plugins/nvim-ts-autotag') ]],
    })
    use({ -- Uses winscroll and TS to give context as you scroll down a file
      "nvim-treesitter/nvim-treesitter-context",
    })

    -- ━━━━━━━━━━━━━━━━❰ Completion Plugins ❱━━━━━━━━━━━━━━━━ --
    use({ -- A completion plugin for neovim coded in Lua.
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      requires = {
        { -- Snippet Engine for Neovim written in Lua.
          "L3MON4D3/LuaSnip",
          module = "luasnip",
          requires = "rafamadriz/friendly-snippets", -- Snippets collection
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        { -- autopairs for Neovim. It support multiple character.
          "windwp/nvim-autopairs",
          after = "nvim-cmp",
          config = [[ require('plugins/nvim-autopairs') ]],
        },
        {
          "zbirenbaum/copilot-cmp",
          after = { "copilot.lua", "nvim-cmp" },
          config = function()
            require("copilot_cmp").setup()
          end,
        },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }, -- nvim-cmp source for neovim builtin LSP client
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }, -- nvim-cmp source for nvim lua
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" }, -- nvim-cmp source for buffer words.
        { "hrsh7th/cmp-path", after = "nvim-cmp" }, -- nvim-cmp source for filesystem paths.
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }, -- nvim-cmp source for vim cmdline
        { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }, -- function signatures under cursers
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      },
      config = [[
				require('plugins/nvim-cmp')
				require('plugins/LuaSnip')
			]],
    })

    -- ━━━━━━━━━━━━━━━━❰ Telescope Plugins ❱━━━━━━━━━━━━━━━━ --

    use({ -- Find, Filter, Preview, Pick. All lua, all the time.
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "debugloop/telescope-undo.nvim",
      },
      config = [[ require('plugins/telescope_nvim') ]],
    })

    -- ━━━━━━━━━━━━━━━━❰ Editing Plugins ❱━━━━━━━━━━━━━━━━ --

    use({ -- A File Explorer For Neovim Written In Lua
      "kyazdani42/nvim-tree.lua",
      opt = true,
      cmd = {
        "NvimTreeToggle",
        "NvimTreeOpen",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
        "NvimTreeRefresh",
      },
      config = [[ require('plugins/nvim-tree') ]],
    })
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

    local indent = require("config.plugins.indent-blankline")
    use(indent)

    local bufferline = require("config.plugins.bufferline")
    use(bufferline)

    use({ -- Git signs written in pure lua
      "lewis6991/gitsigns.nvim",
      opt = true,
      event = { "BufReadPost", "BufNewFile" },
      config = [[ require('plugins/gitsigns_nvim') ]],
    })
    use({ -- fancy status line
      "nvim-lualine/lualine.nvim",
      opt = true,
      after = "nvim-lspconfig",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
        { "arkav/lualine-lsp-progress" },
      },
      config = [[ require('plugins/lualine') ]],
    })
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
    use({
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          log_level = "error",
          auto_session_suppress_dirs = {
            "~/",
            "~/Projects",
            "~/Downloads",
            "/",
          },
        })
      end,
    })
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    })
    use({ --  Neovim motions on speed!
      "phaazon/hop.nvim",
      config = [[ require('plugins/hop_nvim') ]],
    })
    use({ -- smooth scrolling for neovim
      "karb94/neoscroll.nvim",
      config = [[ require('plugins/neoscroll_nvim') ]],
    })
    use({ -- highlight arguments of a function call using treesitter
      "m-demare/hlargs.nvim",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })
    use({ -- Highlight other uses of word under cursor
      "RRethy/vim-illuminate",
      config = [[ require('plugins/vim-illuminate') ]],
    })
    use({ -- help remember keymaps
      "folke/which-key.nvim",
      config = [[ require('plugins/which-key') ]],
    })
    use({ -- an lsp plugin to help stuff
      "glepnir/lspsaga.nvim",
      config = [[ require('plugins/lspsaga_nvim') ]],
    })
    -- use({ -- project manager, like rooter
    -- 	"ahmedkhalf/project.nvim",
    -- 	config = [[ require('plugins/project_nvim') ]],
    -- })
    use({ -- hydra to do cool repeater mappings
      "anuvyklack/hydra.nvim",
    })
    use({ -- markdown generator
      "ellisonleao/glow.nvim",
    })
    use(require("config.plugins.hlslens")) -- advanced search and search highlighing
    use({ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } })

    use({ -- floating terming
      "numToStr/FTerm.nvim",
      config = [[ require('plugins/fterm_nvim') ]],
    })
    use({
      "andymass/vim-matchup",
      setup = function()
        -- may set any options here
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    })
    -- use({ -- debug adapter
    --   "mfussenegger/nvim-dap",
    -- })
    -- ━━━━━━━━━━━━━━━━━❰ DEVELOPMENT ❱━━━━━━━━━━━━━━━━━ --

    -- use { -- tools for haskell
    --	'MrcJkb/haskell-tools.nvim',
    --	requires = {
    --		'neovim/nvim-lspconfig',
    --		'nvim-lua/plenary.nvim',
    --		'nvim-telescope/telescope.nvim',
    --	},
    --	config = [[ require('plugins/haskell-tools') ]]
    -- }

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
