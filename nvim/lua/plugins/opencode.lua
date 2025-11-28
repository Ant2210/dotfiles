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
          terminal = {},
        },
      },
    },
    config = function()
      --- @type opencode.Opts
      vim.g.opencode_opts = {}

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- All Opencode keymaps under `ga`
      vim.keymap.set({ "n", "x" }, "gaa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = " Opencode: Ask" })

      vim.keymap.set({ "n", "x" }, "gas", function()
        require("opencode").select()
      end, { desc = " Opencode: Select action" })

      vim.keymap.set({ "n", "x" }, "gap", function()
        require("opencode").prompt("@this")
      end, { desc = " Opencode: Prompt" })

      vim.keymap.set({ "n", "t" }, "gat", function()
        require("opencode").toggle()
      end, { desc = " Opencode: Toggle panel" })

      vim.keymap.set("n", "gau", function()
        require("opencode").command("session.half.page.up")
      end, { desc = " Opencode: Half page up" })

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
