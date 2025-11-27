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
      vim.keymap.set({ "n", "x" }, "gaA", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = " Opencode: Ask (gaA)" })

      -- gaS = Select action
      vim.keymap.set({ "n", "x" }, "gaS", function()
        require("opencode").select()
      end, { desc = " Opencode: Select action (gaS)" })

      -- gaP = Prompt using @this
      vim.keymap.set({ "n", "x" }, "gaP", function()
        require("opencode").prompt("@this")
      end, { desc = " Opencode: Prompt (gaP)" })

      -- gaT = Toggle Opencode panel
      vim.keymap.set({ "n", "t" }, "gaT", function()
        require("opencode").toggle()
      end, { desc = " Opencode: Toggle panel (gaT)" })

      -- gaU = Scroll session half page up
      vim.keymap.set("n", "gaU", function()
        require("opencode").command("session.half.page.up")
      end, { desc = " Opencode: Half page up (gaU)" })

      -- gaD = Scroll session half page down
      vim.keymap.set("n", "gaD", function()
        require("opencode").command("session.half.page.down")
      end, { desc = " Opencode: Half page down (gaD)" })

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
          { "gaA", icon = "", mode = { "n", "x" } },
          { "gaS", icon = "", mode = { "n", "x" } },
          { "gaP", icon = "", mode = { "n", "x" } },
          { "gaT", icon = "", mode = { "n", "t" } },
          { "gaU", icon = "", mode = "n" },
          { "gaD", icon = "", mode = "n" },
        })
      end
    end,
  },
}
