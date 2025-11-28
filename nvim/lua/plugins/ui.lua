return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },

      on_highlights = function(hl, c)
        -- Make active line subtle
        hl.CursorLine = { bg = c.bg_dark, blend = 85 }

        -- Remove background from inlay hints
        hl.LspInlayHint = {
          fg = c.comment,
          bg = "NONE",
        }
      end,
    },
  },

  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "▕",
      virtcolumn = "80",
      highlight = "LineNr",
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              layout = {
                width = 0.18,
              },
            },
          },
        },
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local colors = require("tokyonight.colors").setup()

      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = colors.red })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = colors.yellow })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = colors.blue })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = colors.orange })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = colors.green })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = colors.magenta })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = colors.cyan })
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
      preset = "modern",
      transparent_cursorline = true,
      options = {
        softwrap = 40,
        overflow = { mode = "wrap" },
        show_related = { enabled = true },
        show_source = { enabled = true, if_many = true },
        add_messages = {
          messages = true, -- always show the first line
          display_count = false, -- do NOT replace with just a count
          use_max_severity = false,
        },

        -- Only show multiline details when cursor is on the line
        multilines = {
          enabled = true,
          always_show = false,
          trim_whitespaces = true,
          severity = nil, -- show multilines for all severities
        },

        show_all_diags_on_cursorline = true, -- expand all on active line
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      vim.diagnostic.config({ virtual_text = false }) -- Disable built-in virtual text
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = false },
    },
  },
}
