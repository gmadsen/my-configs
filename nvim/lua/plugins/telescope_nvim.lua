-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   PluginName: telescope.nvim
--   Github:     github.com/nvim-telescope/telescope.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- safely import telescope
local telescope = require('telescope')

telescope.setup {

	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
		},

		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
				prompt_position = "top",
				preview_width = 0.4,
			},
			vertical = { mirror = false, },
			width = 0.8,
			height = 0.9,
			preview_cutoff = 80,
		},
		file_ignore_patterns = {
			"__pycache__/", "__pycache__/*",

			"build/", "gradle/", "node_modules/", "node_modules/*", "obj/Debug",
			"smalljre_*/*", "target/", "vendor/*", "bin/Debug", "venv/",

			".dart_tool/", ".git/", ".github/", ".gradle/", ".idea/", ".vscode/",

			"%.sqlite3", "%.ipynb", "%.lock", "%.pdb", "%.so",
			"%.dll", "%.class", "%.exe", "%.cache", "%.pdf", "%.dylib",
			"%.jar", "%.docx", "%.met", "%.burp", "%.mp4", "%.mkv", "%.rar",
			"%.zip", "%.7z", "%.tar", "%.bz2", "%.epub", "%.flac", "%.tar.gz",
		},

		file_sorter = require 'telescope.sorters'.get_fuzzy_file,
		generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
		file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

		prompt_prefix = "🔎︎ ",
		selection_caret = "➤ ",
		entry_prefix = "  ",
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		path_display = { 'truncate' }, -- How file paths are displayed ()

		preview = {
			msg_bg_fillchar = " ",
			treesitter = false,
		},

		live_grep = {
			preview = {
				treesitter = true,
			}
		},
		pickers = {
			find_files = {
				mappings = {
					n = {
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s", dir))
						end
					}
				},
			},
		},

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
	},

	extensions = {

		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case". the default case_mode is "smart_case"
		},

		media_files = {
			-- filetypes whitelist
			filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
			find_cmd = "fd" -- find command (defaults to `fd`)
		},

		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},

		undo = {
			use_delta = true,
			-- side_by_side = true,
      		-- layout_strategy = "vertical",
      		-- layout_config = {
      		--  preview_height = 0.8,
      		-- },
		},

		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				winblend = 15,
				layout_config = {
					prompt_position = "top",
					width = 64,
					height = 15,
				},
				border = {},
				previewer = false,
				shorten_path = false,
			},
		}

	},

}




-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- To get telescope-extension loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('media_files')
telescope.load_extension("ui-select")
-- telescope.load_extension("projects")
telescope.load_extension("undo")


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
