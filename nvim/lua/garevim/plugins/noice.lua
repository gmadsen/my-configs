local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>ml",
      function()
        require("noice").cmd("last")
      end,
      { desc = "Noice Last Message" },
    },

    {
      "<leader>mh",
      function()
        require("noice").cmd("history")
      end,
      { desc = "Noice History" },
    },

    {
      "<leader>ma",
      function()
        require("noice").cmd("all")
      end,
      { desc = "Noice All" },
    },
  },
}

function M.config()
  local focused = true
  vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
      focused = true
    end,
  })
  vim.api.nvim_create_autocmd("FocusLost", {
    callback = function()
      focused = false
    end,
  })

  require("noice").setup({
    debug = false,
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      },
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      cmdline_output_to_split = false,
    },
    commands = {
      all = {
        -- options for the message history that you get with `:Noice`
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    },
    format = {
      level = {
        icons = false,
      },
    },
  })
end
return M
