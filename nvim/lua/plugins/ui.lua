return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "▕",
      virtcolumn = "100",
      highlight = "LineNr",
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- use the sidebar layout
            layout = {
              preset = "sidebar",
              layout = {
                width = 0.15,
              },
            },
          },
        },
      },
    },
  },
}
