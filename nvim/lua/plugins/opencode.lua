return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      {
        "folke/snacks.nvim",
        opts = {
          input = {},
          picker = {},
          terminal = {
            -- win = {
            --   width = 0.28, -- default sidebar width in columns
            --   position = "right", -- ensure it opens as a sidebar (not bottom)
            -- },
          },
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- All Opencode keymaps under `ga`

      -- gaA = Ask
      vim.keymap.set({ "n", "x" }, "gaa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = " Opencode: Ask" })

      -- gaS = Select action
      vim.keymap.set({ "n", "x" }, "gas", function()
        require("opencode").select()
      end, { desc = " Opencode: Select action" })

      -- gaP = Prompt using @this
      vim.keymap.set({ "n", "x" }, "gap", function()
        require("opencode").prompt("@this")
      end, { desc = " Opencode: Prompt" })

      -- gaT = Toggle Opencode panel
      vim.keymap.set({ "n", "t" }, "gat", function()
        require("opencode").toggle()
      end, { desc = " Opencode: Toggle panel" })

      -- gaU = Scroll session half page up
      vim.keymap.set("n", "gau", function()
        require("opencode").command("session.half.page.up")
      end, { desc = " Opencode: Half page up" })

      -- gaD = Scroll session half page down
      vim.keymap.set("n", "gad", function()
        require("opencode").command("session.half.page.down")
      end, { desc = " Opencode: Half page down" })

      -- Which-key group and icons for all `ga` Opencode mappings
      local ok, wk = pcall(require, "which-key")
      if ok then
        wk.add({
          {
            "ga",
            group = "Opencode",
            icon = " ",
            mode = { "n", "x", "t" },
          },
          { "gaa", icon = "", mode = { "n", "x" } },
          { "gas", icon = "", mode = { "n", "x" } },
          { "gap", icon = "", mode = { "n", "x" } },
          { "gat", icon = "", mode = { "n", "t" } },
          { "gau", icon = "", mode = "n" },
          { "gad", icon = "", mode = "n" },
        })
      end
    end,
  },
}
